package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MedicineController {

    @GetMapping("/medicine_recommendation")
    public String showMedicinePage() {
        return "medicine_recommendation";
    }
    @GetMapping("/medicine-choice")
    public String showChoicePage() {
        return "medicine-choice";
    }
    @GetMapping("/market-dealer")
    public String showmarketdealerPage() {
        return "market-dealer";
    }
    @GetMapping("/market-farmer")
    public String showmarketfarmerPage() {
        return "market-farmer";
    }
	@GetMapping("/market-choice")
    public String showmarketChoicePage() {
        return "market-choice";
    }
	

    

    // 2. Fresh Farmer Path
    @GetMapping("/fresh-farmer-input")
    public String showFreshFarmerPage() {
        return "fresh-farmer-input"; // The page where they select the crop
    }
    @PostMapping("/fresh-farmer-result")
    public String getGrowthSchedule(@RequestParam("cropName") String crop, Model model) {
        List<Map<String, Object>> schedule = new ArrayList<>();

        if ("Wheat".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Seed Treatment", "0-1 Days", "fas fa-seedling", 
                List.of(createMed("Vitavax Power", "2g/kg", "Seed coating"), createMed("Trichoderma", "5g/kg", "Bio-treatment")),
                List.of("Use HD-2967 varieties", "Sow in Nov first week")));
            schedule.add(createStage("2", "Sowing & Basal", "1-3 Days", "fas fa-leaf", 
                List.of(createMed("DAP", "50kg/acre", "At sowing"), createMed("Pendimethalin", "1.3L/acre", "Pre-emergence")),
                List.of("Maintain 22cm spacing", "Ensure soil moisture")));
            schedule.add(createStage("3", "Tillering & Growth", "21-45 Days", "fas fa-wheat-awn", 
                List.of(createMed("Urea (46% N)", "55kg/acre", "Top dressing"), createMed("Zinc Sulphate", "10kg/acre", "Micronutrient")),
                List.of("First irrigation at 21 DAS (CRI stage)", "Monitor for termites")));
            schedule.add(createStage("4", "Heading & Filling", "75-100 Days", "fas fa-certificate", 
                List.of(createMed("Propiconazole 25% EC", "200ml/acre", "Rust prevention"), createMed("MOP (Potash)", "20kg/acre", "Grain weight")),
                List.of("Watch for yellow rust", "Last irrigation at dough stage")));
        } 
        else if ("Tomato".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Nursery & Planting", "0-25 Days", "fas fa-seedling", 
                List.of(createMed("Imidacloprid", "5ml/10L", "Seedling dip"), createMed("Trichoderma", "1kg/acre", "Soil mix")),
                List.of("Select virus-free seedlings", "Plant in raised beds")));
            schedule.add(createStage("2", "Vegetative Growth", "25-50 Days", "fas fa-leaf", 
                List.of(createMed("Mancozeb", "2g/L", "Early Blight prevention"), createMed("19:19:19 NPK", "5g/L", "Foliar spray")),
                List.of("Start staking/support for plants", "Prune lower leaves")));
            schedule.add(createStage("3", "Flowering & Fruit Set", "50-80 Days", "fas fa-flower", 
                List.of(createMed("Boron", "1g/L", "Fruit set boost"), createMed("Chlorantraniliprole", "0.4ml/L", "Fruit borer control")),
                List.of("Avoid heavy nitrogen now", "Maintain consistent irrigation")));
            schedule.add(createStage("4", "Ripening & Harvest", "80-120 Days", "fas fa-apple-whole", 
                List.of(createMed("Potassium Nitrate", "5g/L", "Fruit quality"), createMed("Copper Oxychloride", "2.5g/L", "Late blight shield")),
                List.of("Harvest at 'Breaker Stage'", "Remove infected fruits")));
        }
        else if ("Rice".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Nursery Management", "0-25 Days", "fas fa-seedling", 
                List.of(createMed("Carbendazim", "2g/kg", "Seed soak"), createMed("Pretilachlor", "500ml/acre", "Weed control")),
                List.of("Soak seeds for 24 hours", "Maintain thin water layer")));
            schedule.add(createStage("2", "Transplanting Phase", "25-35 Days", "fas fa-water", 
                List.of(createMed("Zinc Sulphate", "10kg/acre", "Soil mix"), createMed("Cartap Hydrochloride", "5kg/acre", "Stem borer control")),
                List.of("Plant 25-30 day old seedlings", "Keep 2-3cm water level")));
            schedule.add(createStage("3", "Active Tillering", "45-65 Days", "fas fa-leaf", 
                List.of(createMed("Urea", "40kg/acre", "Top dressing"), createMed("Neem Oil", "5ml/L", "Pest repellent")),
                List.of("Apply fertilizer after weeding", "Monitor for Leaf Folder")));
            schedule.add(createStage("4", "Panicle & Ripening", "80-110 Days", "fas fa-wheat-awn", 
                List.of(createMed("Hexaconazole", "2ml/L", "Sheath blight shield"), createMed("Potash", "20kg/acre", "Grain filling")),
                List.of("Maintain water until dough stage", "Check for BPH pests")));
        }
     // COTTON: Full Cycle
        else if ("Cotton".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Sowing & Early Guard", "0-15 Days", "fas fa-seedling", 
                List.of(createMed("Thiamethoxam 30% FS", "4g/kg seed", "Seed coating")),
                List.of("Prevents early sucking pests", "Sow at 4-5cm depth for better germination")));
            
            schedule.add(createStage("2", "Vegetative Growth", "15-45 Days", "fas fa-leaf", 
                List.of(createMed("Acephate 75% SP", "2g/L", "Jassid control"), createMed("Urea", "30kg/acre", "Nitrogen boost")),
                List.of("Monitor Whitefly population closely", "Inter-cultivate to remove weeds")));
            
            schedule.add(createStage("3", "Flowering & Boll formation", "45-90 Days", "fas fa-clover", 
                List.of(createMed("Alpha-methrin", "1.5ml/L", "Bollworm shield"), createMed("Boron", "1g/L", "Boll retention")),
                List.of("Avoid water stress during flowering", "Watch for Pink Bollworm symptoms")));
            
            schedule.add(createStage("4", "Boll Bursting", "90-130 Days", "fas fa-cloud", 
                List.of(createMed("Magnesium Sulphate", "5g/L", "Prevents reddening")),
                List.of("Pick clean cotton from open bolls", "Stop irrigation 2 weeks before final picking")));
        }

        // POTATO: Full Cycle
        else if ("Potato".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Tuber Treatment", "0-1 Days", "fas fa-circle", 
                List.of(createMed("Boric Acid", "3% solution", "Tuber dip")),
                List.of("Dry tubers in shade after dipping", "Prevents Black Scurf and common scab")));
            
            schedule.add(createStage("2", "Stolon Formation", "15-35 Days", "fas fa-leaf", 
                List.of(createMed("Metribuzin", "200g/acre", "Pre-emergence weed control"), createMed("Chlorpyrifos", "2L/acre", "Termite protection")),
                List.of("Perform earthing-up when plants are 15-20cm tall", "Ensure soil covers the tubers")));
            
            schedule.add(createStage("3", "Tuber Bulking", "45-70 Days", "fas fa-expand", 
                List.of(createMed("NPK 0:0:50", "10g/L", "Size & Weight boost"), createMed("Mancozeb", "2.5g/L", "Early blight control")),
                List.of("Maintain uniform soil moisture for smooth tubers")));
            
            schedule.add(createStage("4", "Maturation", "75-100 Days", "fas fa-mountain", 
                List.of(createMed("Copper Oxychloride", "3g/L", "Late blight shield")),
                List.of("Stop irrigation 10 days before harvest", "Haulm cutting (De-haulming) for skin hardening")));
        }

        // MAIZE: Full Cycle
        else if ("Maize".equalsIgnoreCase(crop)) {
            schedule.add(createStage("1", "Sowing & Weed Guard", "0-3 Days", "fas fa-seedling", 
                List.of(createMed("Atrazine 50% WP", "500g/acre", "Pre-emergence")),
                List.of("Ensure proper drainage in the field", "Sow seeds at 5cm depth")));
            
            schedule.add(createStage("2", "Knee-High Stage", "20-40 Days", "fas fa-leaf", 
                List.of(createMed("Urea", "45kg/acre", "Top dressing"), createMed("Emamectin Benzoate", "0.4g/L", "Fall Armyworm")),
                List.of("Apply fertilizer in the whorls", "Check for center-leaf pinholes (FAW sign)")));
            
            schedule.add(createStage("3", "Tasseling/Silking", "45-65 Days", "fas fa-certificate", 
                List.of(createMed("Zinc Sulphate", "5g/L", "Grain setting boost")),
                List.of("Most critical stage for water", "Drought now will significantly reduce yield")));
            
            schedule.add(createStage("4", "Grain Maturity", "75-100 Days", "fas fa-wheat-awn", 
                List.of(createMed("Potassium Nitrate", "10g/L", "Grain filling")),
                List.of("Harvest when kernels are hard and milk line disappears", "Dry properly for storage")));
        }
        // ... Repeat same pattern for Cotton, Potato, Maize using createStage(num, title, duration, icon, meds, tips)

        model.addAttribute("crop", crop);
        model.addAttribute("schedule", schedule);
        return "fresh-farmer-result";
    }

  
    // 3. Moderate Farmer Path (Your existing Plant Doctor page)
   
    @PostMapping("/predict-medicine")
    public String predictMedicine(
            @RequestParam("cropName") String cropName,
            @RequestParam("symptom") String symptom,
            @RequestParam("image") MultipartFile image,
            Model model
    ) {
        // --- 1. PREPARE IMAGE (Convert to Base64) ---
        String imageBase64 = "";
        String mimeType = "image/jpeg"; // Default
        
        if (!image.isEmpty()) {
            try {
                byte[] bytes = image.getBytes();
                String base64Content = Base64.getEncoder().encodeToString(bytes);
                mimeType = image.getContentType();
                imageBase64 = "data:" + mimeType + ";base64," + base64Content;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // --- 2. CONNECT TO PYTHON (The "AI Brain") ---
        String disease = "Unknown";
        String severity = "Moderate";
        String medicine = "Consult Expert";
        String dosage = "N/A";
        String prevention = "Monitor closely";
        
        try {
            // A. Prepare the data to send
            String pythonUrl = "http://127.0.0.1:5000/predict";
            
            // We create a Map to hold our JSON data: {"image": "...", "crop": "Wheat"}
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("image", imageBase64);
            requestBody.put("crop", cropName);

            // B. Set Headers (Tell Python we are sending JSON)
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> request = new HttpEntity<>(requestBody, headers);

            // C. Send Request & Get Response
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map> response = restTemplate.postForEntity(pythonUrl, request, Map.class);
            
            // D. Read the answer from Python
            Map<String, Object> aiResult = response.getBody();
            
            if (aiResult != null) {
                disease = (String) aiResult.getOrDefault("disease", "Unknown");
                severity = (String) aiResult.getOrDefault("severity", "Moderate");
                medicine = (String) aiResult.getOrDefault("medicine", "Consult Expert");
                
                // ✅ THIS WAS THE FIX: I uncommented this line!
                dosage = (String) aiResult.getOrDefault("dosage", "Check Label"); 
                
                prevention = (String) aiResult.getOrDefault("prevention", "Monitor crop health");
            }

        } catch (Exception e) {
            System.out.println("❌ ERROR Connecting to Python: " + e.getMessage());
            disease = "AI Service Unavailable";
            prevention = "Please ensure the Python script is running.";
        }

        // --- 3. SEND DATA TO JSP (Result Page) ---
        model.addAttribute("uploadedImage", imageBase64);
        model.addAttribute("crop", cropName);
        model.addAttribute("symptom", symptom);
        
        // These now come from Python!
        model.addAttribute("disease", disease);
        model.addAttribute("severity", severity);
        model.addAttribute("medicine", medicine);
        model.addAttribute("dosage", dosage);
        model.addAttribute("prevention", prevention);

        return "medicine_result";
    }
 // Place these at the very bottom of your MedicineController class
 // --- HELPER METHODS (Ensure only ONE version of these exists at the bottom) ---

    private Map<String, Object> createStage(String num, String title, String duration, String icon, List<Map<String, String>> meds, List<String> tips) {
        Map<String, Object> stage = new HashMap<>();
        stage.put("stageNum", num);
        stage.put("stageTitle", title);
        stage.put("duration", duration); // This matches your JSP call
        stage.put("stageIcon", icon);
        stage.put("medicines", meds);
        stage.put("tips", tips);
        return stage;
    }

    private Map<String, String> createMed(String name, String dose, String tag) {
        Map<String, String> med = new HashMap<>();
        med.put("name", name);
        med.put("dose", dose);
        med.put("tag", tag);
        return med;
    }
} // Final bracket of the class
