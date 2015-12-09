package promosxpuntosapp

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(StandardUser)
class StandardUserSpec extends Specification {

    def setup() {
        mockForConstraintsTests(StandardUser)
    }

    def cleanup() {
    }

    @Unroll("test StandardUser attribute gender: #gender, field: #field, valid: #valid ")
    def "Testing Domain Class StandardUser - gender"() {
        when:
        def t_Product_gender = new StandardUser(lastname: "llastnametest",gender: gender, birthday: '31/12/99', telephone: 34554433, points: 1)
        t_StandardUser_gender.validate()

        then:
        t_StandardUser_gender.errors.hasFieldErrors("gender") == false

        where:
        gender   | valid | field
        null     | false | 'null'
        'ok'     | false | 'algo'
        'male'   | true  | 'male'
        'female' | true  | 'female'
    }

    @Unroll("test StandardUser attribute gender: #telephone, field: #field, valid: #valid ")
    def "Testing Domain Class StandardUser - telephone"() {
        when:
        def t_Product_telephone = new StandardUser(lastname: "llastnametest",gender: "female ", birthday: '31/12/99', telephone: telephone, points: 1)
        t_StandardUser_gender.validate()

        then:
        t_StandardUser_gender.errors.hasFieldErrors("telephone") == false

        where:
        gender   | valid | field
        null     | false | 'null'
        'ok'     | false | 'algo'
        123           | false | 'minRange'
        1234567890123 | false | 'maxRange'
        12345678 | true  | 'Range'
    }
}