/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abm.jakaria.school;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Abm Jakaria
 */
@Component("commiteeFormValidator")
public class CommiteeFormValidator implements Validator {

    @SuppressWarnings("unchecked")

    @Override
    public boolean supports(Class clazz) {
        return Commitee.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object model, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "Name is required.");
    }

}
