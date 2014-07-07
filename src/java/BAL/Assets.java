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

    public static String DisplayError(String MensajeToDisplay, String UrlToRedirect, String Ancho, String TamanioFuente) {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String AnchoPlusPercent = Ancho + "%";
        String error = "<link href=\"../" + "scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login" + Ancho + TamanioFuente + "{font-size:" + TamanioFuente + "; width:" + AnchoPlusPercent + ";margin:auto;margin-top:50px; }</style><div id='login" + Ancho + TamanioFuente + "' class='alert alert-danger'> ";
        error = error + MensajeToDisplay;
        error = error + "<br><a href='" + UrlToRedirect + "'>Regresar</a></div>";
        return error;
    }
}
