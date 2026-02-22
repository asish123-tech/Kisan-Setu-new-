package in.sp.main.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Service
public class MarketService {

    public List<Map<String, Object>> getLiveMandiData() {
        // 1. PULL API KEY FROM RENDER ENVIRONMENT (FRESH APPROACH)
        // Locally, this will look for the key in your .env
        String apiKey = System.getenv("SALES_API_KEY");
        if (apiKey == null) {
            // Fallback for local testing if .env isn't loaded
            apiKey = "579b464db66ec23bdd0000011311978df7bc45f24853a1ff4c3a9286";
        }

        String url = "https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24?api-key=" 
                     + apiKey + "&format=json&limit=10";
        
        try {
            RestTemplate restTemplate = new RestTemplate();
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
            
            if (response != null && response.containsKey("records")) {
                return (List<Map<String, Object>>) response.get("records");
            }
        } catch (Exception e) {
            // Render logs will show exactly why it failed
            System.err.println("API FETCH ERROR: " + e.getMessage());
        }
        return new ArrayList<>(); 
    }
}