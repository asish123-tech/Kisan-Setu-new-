package in.sp.main.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.*;
import javax.net.ssl.*;
import java.security.cert.X509Certificate;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MarketService {

    public List<Map<String, Object>> getLiveMandiData() {
        String urlString = "https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24?api-key=579b464db66ec23bdd0000011311978df7bc45f24853a1ff4c3a9286&format=json&limit=10";
        
        try {

            TrustManager[] trustAllCerts = new TrustManager[] {
                new X509TrustManager() {
                    public X509Certificate[] getAcceptedIssuers() { return null; }
                    public void checkClientTrusted(X509Certificate[] certs, String authType) { }
                    public void checkServerTrusted(X509Certificate[] certs, String authType) { }
                }
            };

            // 2. INSTALL THE ALL-TRUSTING TRUST MANAGER
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            // 3. CREATE A HOSTNAME VERIFIER THAT ALLOWS ALL
            HostnameVerifier allHostsValid = (hostname, session) -> true;
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

            // 4. NOW MAKE THE REQUEST
            URL url = new URL(urlString);
            HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept", "application/json");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(response.toString(), Map.class);
            return (List<Map<String, Object>>) map.get("records");

        } catch (Exception e) {
            System.err.println("SSL BYPASS ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return new ArrayList<>(); 
    }
}