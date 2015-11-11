package promosxpuntosapp


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StandardUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StandardUser.list(params), model: [standardUserInstanceCount: StandardUser.count()]
    }

    def show(StandardUser standardUserInstance) {
        respond standardUserInstance
    }

    def create() {
        respond new StandardUser(params)
    }

    def logIn(){
        def usuario = StandardUser.findByNickname(params.nickname)
        if (usuario){
            if (usuario.password==params.password){
                session.user=usuario
                redirect controller: "profile"
                return
            }else{
                redirect controller: "index", fragment: "two"
                flash.message = "Contrase�a incorrecta"
                return
            }
        }else{
            redirect controller: "index", fragment: "two"
            flash.message = "Nombre de Usuario incorrecto"
            return
        }
    }

    def logOut(){
        session.user=null
        redirect controller: "index"
    }

    @Transactional
    def save(StandardUser standardUserInstance) {
        if (standardUserInstance == null) {
            notFound()
            return
        }

        if (standardUserInstance.hasErrors()) {
            redirect controller: "index", fragment: "subscribe"
            return
        }

        standardUserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'standardUser.label', default: 'StandardUser'), standardUserInstance.id])
                session.user=standardUserInstance
                redirect controller: "profile"
            }
            '*' { respond standardUserInstance, [status: CREATED] }
        }
    }

    def edit(StandardUser standardUserInstance) {
        respond standardUserInstance
    }

    @Transactional
    def update(StandardUser standardUserInstance) {
        if (standardUserInstance == null) {
            notFound()
            return
        }

        if (standardUserInstance.hasErrors()) {
            respond standardUserInstance.errors, view: 'edit'
            return
        }

        standardUserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StandardUser.label', default: 'StandardUser'), standardUserInstance.id])
                redirect standardUserInstance
            }
            '*' { respond standardUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StandardUser standardUserInstance) {

        if (standardUserInstance == null) {
            notFound()
            return
        }

        standardUserInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StandardUser.label', default: 'StandardUser'), standardUserInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'standardUser.label', default: 'StandardUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}