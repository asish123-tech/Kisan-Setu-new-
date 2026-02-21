package in.sp.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CropController { 
	// Your class name might be different
	// --- ADD THIS METHOD TO SHOW THE PAGE ---
    @GetMapping("/crop-recommendation") 
    public String showCropForm() {
        return "crop_recommendation"; // This must match your JSP filename exactly!
    }

	@PostMapping("/predict-crop")
    public String predictCrop(
            @RequestParam("state") String state,
            @RequestParam("city") String city,
            @RequestParam("temperature") double temperature,
            @RequestParam("humidity") double humidity,
            @RequestParam("soilType") String soilType,
            // CHANGED: We now ask for 'phLevel', NOT 'waterSource'
            @RequestParam("phLevel") double phLevel, 
            Model model
    ) {
        
        // --- 1. DEFINE CROPS LOGIC ---
        String topCropName = "Wheat";
        String topCropReason = "Perfect for current temperature";
        int topScore = 95;

        String secondName = "Barley";
        String secondReason = "Good alternative";
        int secondScore = 85;
        
        String thirdName = "Mustard";
        String thirdReason = "Requires less water";
        int thirdScore = 75;

        // --- NEW LOGIC BASED ON pH ---
        if (phLevel < 5.5) {
            topCropName = "Tea"; topCropReason = "Loves acidic soil (pH " + phLevel + ")"; topScore = 92;
            secondName = "Potato"; secondReason = "Prefers slightly acidic soil"; secondScore = 80;
        } else if (phLevel > 7.5) {
            topCropName = "Barley"; topCropReason = "Tolerates alkaline soil well"; topScore = 90;
            secondName = "Cotton"; secondReason = "High tolerance for pH " + phLevel; secondScore = 82;
        } else {
            // Neutral Soil (6.0 - 7.5)
            if (temperature > 25) {
                topCropName = "Rice"; topCropReason = "Great match for Temp & Neutral Soil"; topScore = 96;
                secondName = "Sugarcane"; secondReason = "Thrives in this humidity"; secondScore = 88;
            }
        }

        // --- 2. SEND DATA TO RESULT PAGE ---
        // Note: We use a simple 'Crop' object wrapper or just send strings
        // To keep it simple for you, I will send strings directly to match your JSP
        
        // TOP CROP
        model.addAttribute("topCrop", new Crop(topCropName, topCropReason, topScore));
        // SECOND CROP
        model.addAttribute("secondCrop", new Crop(secondName, secondReason, secondScore));
        // THIRD CROP
        model.addAttribute("thirdCrop", new Crop(thirdName, thirdReason, thirdScore));
        
        model.addAttribute("city", city);
        model.addAttribute("temp", temperature);

        return "crop_result";
    }

    // Keep your Crop class definition inside or outside
	// --- MAKE SURE THIS CLASS IS PUBLIC AND STATIC ---
    public static class Crop {
        
        // --- 1. MAKE THESE VARIABLES PUBLIC ---
        public String name;
        public String reason;
        public int score;

        // --- 2. CONSTRUCTOR ---
        public Crop(String name, String reason, int score) {
            this.name = name;
            this.reason = reason;
            this.score = score;
        }
        
        // --- 3. ADD GETTERS (Just in case JSP demands them) ---
        public String getName() { return name; }
        public String getReason() { return reason; }
        public int getScore() { return score; }
    }
}