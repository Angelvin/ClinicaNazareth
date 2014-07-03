/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import BEANS.bedipaciente;

/**
 *
 * @author Angel
 */
public class edPaciente {

    public static bedipaciente getPersona(int id) {

        return bedipaciente.getDatos(id);

    }
}
