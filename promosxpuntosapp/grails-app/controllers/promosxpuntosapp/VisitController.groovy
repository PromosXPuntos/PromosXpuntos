package promosxpuntosapp

import org.apache.commons.lang.RandomStringUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VisitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Visit.list(params), model: [visitInstanceCount: Visit.count()]
    }

    def show(Visit visitInstance) {
        respond visitInstance
    }

    def create() {
        respond new Visit(params)
    }

    @Transactional
    def save(Visit visitInstance) {

        def qrCode = params.qrCode

        def nicknameEstablishment = qrCode.split("-")

        try{
            visitInstance.establishment = (Establishment?.findByNicknameEstablishment(nicknameEstablishment[0]))

        }catch (NullPointerException e){
            print "sssssssss"
        }

        visitInstance.dateVisit = new Date()

        def standardUser = StandardUser?.findById(params."standardUser.id")

        print(standardUser.name)

        print(nicknameEstablishment[0])
        print(visitInstance.establishment.nicknameEstablishment)

        def customer = Customer?.findById(Establishment?.findByNicknameEstablishment(nicknameEstablishment[0]).customerId)

        print(customer.id)

        print(standardUser.points)

        print(standardUser.points.containsValue(customer.id))

        if (standardUser.points.containsValue(customer.id)) {
            def actual = Integer.parseInt(standardUser.points[customer.id])
            print (actual)
            standardUser.points[customer.id] = actual + 1
        }
        else{
            standardUser.points[customer.id] = 1
        }

        print(standardUser.points)

        if (visitInstance == null) {
            notFound()
            return
        }

        if (visitInstance.hasErrors()) {
            print("askjñdfgñajskdgfsadjkfñg")
            print(visitInstance.errors.fieldError)
            respond visitInstance.errors, view: '/faces/QRScanner'
            return
        }

        visitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'visit.label', default: 'Visit'), visitInstance.id])
                session.visit=visitInstance
                redirect controller: "visitDone"
                standardUser.save()
            }
            '*' { respond visitInstance, [status: CREATED] }
        }



    }

    def guardar() {
        def visitInstance = new Visit()
        def qrCode = params.qrCode
        def nicknameEstablishment = qrCode.split("-")

        visitInstance.establishment = Establishment?.findByNicknameEstablishment(nicknameEstablishment[0])
        visitInstance.dateVisit = new Date()
        visitInstance.qrCode = qrCode

        def standardUser = StandardUser?.findById(params."standardUser.id")
        def customer = Customer?.findById(visitInstance.establishment.customerId)
        def previousVisit = Visit.findAllByEstablishment(visitInstance.establishment)
        def repeatedCode = Visit.findByQrCode(qrCode)
        def control = false
        if (previousVisit != null) {
            previousVisit.each {
                if (it.dateVisit.year == visitInstance.dateVisit.year && it.dateVisit.month == visitInstance.dateVisit.month && it.dateVisit.day == visitInstance.dateVisit.day) {
                    control = true
                }
            }
        }
        if (control) {
            flash.message = "Ya visitaste este establecimiento el día de hoy. Solo puedes realizar una visita diaria"
            redirect controller: 'profile', action: 'QRScanner'
        } else {
            if (repeatedCode != null){
                flash.message = "Este código QR ya no es valido. Inténtalo de nuevo"
                redirect controller: 'profile', action: 'QRScanner'
            }else {
                if (standardUser.points == null) {
                    standardUser.points = new TreeMap<Integer, Integer>()
                }
                if (standardUser.points.containsKey(customer.id)) {
                    def actual = standardUser.points.get(customer.id)
                    standardUser.points[customer.id] = actual + 1
                } else {
                    standardUser.points[customer.id] = 1
                }
                visitInstance.standardUser = standardUser
                session.user = standardUser
                session.visit = visitInstance
                visitInstance.save flush: true
                standardUser.save flush: true
                redirect controller: "visitDone"
            }
        }
    }

    def edit(Visit visitInstance) {
        respond visitInstance
    }

    @Transactional
    def update(Visit visitInstance) {
        if (visitInstance == null) {
            notFound()
            return
        }

        if (visitInstance.hasErrors()) {
            respond visitInstance.errors, view: 'edit'
            return
        }

        visitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Visit.label', default: 'Visit'), visitInstance.id])
                redirect visitInstance
            }
            '*' { respond visitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Visit visitInstance) {

        if (visitInstance == null) {
            notFound()
            return
        }

        visitInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Visit.label', default: 'Visit'), visitInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'visit.label', default: 'Visit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


}
