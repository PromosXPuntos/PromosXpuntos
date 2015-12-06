package promosxpuntosapp

import org.apache.commons.lang.RandomStringUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShopRecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ShopRecord.list(params), model: [shopRecordInstanceCount: ShopRecord.count()]
    }

    def show(ShopRecord shopRecordInstance) {
        respond shopRecordInstance
    }

    def create() {
        respond new ShopRecord(params)
    }

    def search(){
        def shop = ShopRecord.findByConsecutive((String) params.consecutive)
        if(shop == null){
            flash.message = "Usuario no encontrado o recompensa no valida"
            redirect controller: "profileEstablishment", action: "validateShopRecord"
        }
        else {
            def validator = shop.validate
            if (validator) {
                session.shopRecord = shop
                redirect controller: "validateSuccess"
            } else {
                flash.message = "La recompensa ya fue reclamada"
                redirect controller: "profileEstablishment", action: "validateShopRecord"
            }
        }
    }

    def validateShop(){
        def shop = ShopRecord.findByConsecutive((String) params.consecutive)
        shop.validate = false
        shop.placeValidate = Establishment.findByNicknameEstablishment((String) params.nickname)
        shop.save flush: true
        redirect controller: "profileEstablishment"
    }

    def showHistory(){
        def user = ShopRecord.findByStandardUser(StandardUser.findById(params.userId))
        session.user = user
    }

    def redimir(){
        def user = StandardUser?.findById(params."standardUser.id")
        def customer = Customer?.findById(params."customer.id")
        def asd = Integer.parseInt(params."reward.id")
        def reward = Reward.findById(asd)
        def date = new Date()
        def shopRecordinstance= new ShopRecord( )
        shopRecordinstance.standardUser = user
        shopRecordinstance.customer = customer
        shopRecordinstance.reward = reward
        shopRecordinstance.date = date
        shopRecordinstance.consecutive = new RandomStringUtils().random( 10, 'abcdefghijklmnopqrstuvwqyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789')
        shopRecordinstance.validate = true
        shopRecordinstance.placeValidate = ""
        if (user.points[customer.id] >= reward.point && reward.available > 0){
            //puede redimir
            user.points[customer.id] -= reward.point
            reward.available -= 1
            shopRecordinstance.save flush:true
            user.save update:true, flush:true
            reward.save flush:true
            session.user=user
            session.shopRecord = shopRecordinstance
            redirect controller: "ShopRecordDone"
        }else{
            //no puede
            redirect controller: "EstablishmentListUser"
            flash.message = "No tienes puntos suficientes o no hay disponibilidad"
        }
    }

    @Transactional
    def save(ShopRecord shopRecordInstance) {
        if (shopRecordInstance == null) {
            notFound()
            return
        }

        if (shopRecordInstance.hasErrors()) {
            respond shopRecordInstance.errors, view: 'create'
            return
        }

        shopRecordInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shopRecord.label', default: 'ShopRecord'), shopRecordInstance.id])
                redirect shopRecordInstance
            }
            '*' { respond shopRecordInstance, [status: CREATED] }
        }
    }

    def edit(ShopRecord shopRecordInstance) {
        respond shopRecordInstance
    }

    @Transactional
    def update(ShopRecord shopRecordInstance) {
        if (shopRecordInstance == null) {
            notFound()
            return
        }

        if (shopRecordInstance.hasErrors()) {
            respond shopRecordInstance.errors, view: 'edit'
            return
        }

        shopRecordInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ShopRecord.label', default: 'ShopRecord'), shopRecordInstance.id])
                redirect shopRecordInstance
            }
            '*' { respond shopRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ShopRecord shopRecordInstance) {

        if (shopRecordInstance == null) {
            notFound()
            return
        }

        shopRecordInstance.delete flush: true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ShopRecord.label', default: 'ShopRecord'), shopRecordInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shopRecord.label', default: 'ShopRecord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
