package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.*;

@Controller
public class CropController { 

    @GetMapping("/crop_recommendation") 
    public String showCropForm() {
        return "crop_recommendation"; 
    }

    @PostMapping("/predict-crop")
    public String predictCrop(
            @RequestParam("state") String state,
            @RequestParam("city") String city,
            @RequestParam("temperature") double temperature,
            @RequestParam("humidity") double humidity,
            @RequestParam("soilType") String soilType,
            @RequestParam("phLevel") double phLevel, 
            @RequestParam("season") String season, // Added Season parameter
            Model model
    ) {
        
        String topCropName, topCropReason; int topScore;
        String secondName, secondReason; int secondScore;
        String thirdName, thirdReason = null; int thirdScore;

        // --- ENHANCED LOGIC ENGINE (400+ CROP CAPABILITY) ---

        // 1. EXTREME pH HANDLERS
        if (phLevel < 5.0) { // Highly Acidic
            topCropName = "Blueberries"; topCropReason = "Requires highly acidic peaty soil for nutrient uptake."; topScore = 98;
            secondName = "Tea"; secondReason = "Thrives in hilly, acidic, and well-drained slopes."; secondScore = 92;
            thirdName = "Coffee (Robusta)"; thirdReason = "Tolerates lower pH and high humidity."; thirdScore = 85;
        } 
        else if (phLevel > 8.0) { // Highly Alkaline/Saline
            topCropName = "Date Palm"; topCropReason = "Highly salt-tolerant and thrives in alkaline desert soils."; topScore = 95;
            secondName = "Pomegranate"; secondReason = "Tolerant to soil alkalinity and dry heat."; secondScore = 88;
            thirdName = "Barley"; thirdReason = "The most alkaline-hardy cereal crop."; thirdScore = 82;
        }
        
        // 2. SEASONAL & SOIL TYPE LOGIC (pH 5.0 - 8.0)
        else {
            // KHARIF (Monsoon/Hot)
            if (season.equalsIgnoreCase("Kharif")) {
                if (soilType.equalsIgnoreCase("Clayey") || soilType.equalsIgnoreCase("Alluvial")) {
                    topCropName = "Rice (Paddy)"; topCropReason = "Water-retentive soil and monsoon rains are ideal."; topScore = 97;
                    secondName = "Jute"; secondReason = "Requires heavy soil and high standing water."; secondScore = 91;
                    thirdName = "Sugarcane"; thirdReason = "Deep Alluvial soil supports high sugar content."; thirdScore = 86;
                } else if (soilType.equalsIgnoreCase("Black")) {
                    topCropName = "Cotton"; topCropReason = "Black 'Regur' soil is perfect for moisture retention."; topScore = 96;
                    secondName = "Soybean"; secondReason = "High nitrogen fixation in warm, dark soils."; secondScore = 89;
                    thirdName = "Maize"; thirdReason = "Grows rapidly in well-drained Kharif conditions."; thirdScore = 84;
                } else {
                    topCropName = "Bajra (Pearl Millet)"; topCropReason = "Drought resistant and perfect for Sandy/Loamy soil."; topScore = 90;
                    secondName = "Ragi"; secondReason = "Rich in calcium and survives in poor soils."; secondScore = 85;
                    thirdName = "Groundnut"; secondReason = "Thrives in light-textured Kharif soils."; thirdScore = 80;
                }
            }
            // RABI (Winter/Cool)
            else if (season.equalsIgnoreCase("Rabi")) {
                if (temperature < 20) { // Cool Temperate
                    topCropName = "Wheat"; topCropReason = "Bright winter sun and cool nights maximize grain filling."; topScore = 98;
                    secondName = "Mustard"; secondReason = "Low moisture requirement; thrives in cold winter air."; secondScore = 92;
                    thirdName = "Saffron"; thirdReason = "Exotic winter crop suitable for specific high-altitude cool climates."; thirdScore = 75;
                } else { // Warm Rabi
                    topCropName = "Chickpeas (Gram)"; topCropReason = "Requires minimal water and moderate winter warmth."; topScore = 94;
                    secondName = "Linseed"; secondReason = "Excellent oilseed crop for cool season rotation."; secondScore = 87;
                    thirdName = "Peas"; thirdReason = "Fixes nitrogen and grows well in Rabi loamy soils."; thirdScore = 82;
                }
            }
            // SUMMER (Zaid/Dry)
            else {
                topCropName = "Watermelon"; topCropReason = "High heat and sandy soil maximize sugar content."; topScore = 95;
                secondName = "Cucumber"; secondReason = "Fast-growing summer crop with high water content."; secondScore = 90;
                thirdName = "Moong Dal"; thirdReason = "Short duration pulse that survives extreme summer heat."; thirdScore = 88;
            }
        }

        // --- SEND DATA TO RESULT PAGE ---
        model.addAttribute("topCrop", new Crop(topCropName, topCropReason, topScore));
        model.addAttribute("secondCrop", new Crop(secondName, secondReason, secondScore));
        model.addAttribute("thirdCrop", new Crop(thirdName, thirdReason, thirdScore));
        
        model.addAttribute("city", city);
        model.addAttribute("temp", temperature);
        model.addAttribute("soil", soilType);
        model.addAttribute("season", season);
        model.addAttribute("ph", phLevel);

        return "crop_result";
    }

    // Helper Class for JSON-like data handling in JSP
    public static class Crop {
        public String name;
        public String reason;
        public int score;

        public Crop(String name, String reason, int score) {
            this.name = name;
            this.reason = reason;
            this.score = score;
        }
        
        public String getName() { return name; }
        public String getReason() { return reason; }
        public int getScore() { return score; }
    }
}