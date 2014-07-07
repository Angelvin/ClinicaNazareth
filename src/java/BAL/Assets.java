/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daMgeL
 */
public class Assets {

    public static void RedirectToUrl(String RedirectTo, HttpServletResponse response) throws IOException {
        //Metodo q espera una URL VALIDA y redirecciona hacia ella.
        String getDirectorioActual = "/ClinicaNazareth";
        String route = getDirectorioActual + RedirectTo;
        String url = response.encodeRedirectURL(route);
        System.out.println("LA RUTA EN ASSETS ES:" + url);
        response.sendRedirect(url);
    }
}
