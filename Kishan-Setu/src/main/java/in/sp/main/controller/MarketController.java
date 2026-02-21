package in.sp.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam; // Added this
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.MarketListing;
import in.sp.main.repository.MarketListingRepository;
import in.sp.main.service.MarketService;

@Controller
@RequestMapping("/market")
public class MarketController {

    @Autowired
    private MarketListingRepository marketRepo;
    @Autowired
    private MarketService marketService;

    @GetMapping("/trends")
    public String showLiveTrends(Model model) {
        List<Map<String, Object>> trends = marketService.getLiveMandiData();
        model.addAttribute("trends", trends);
        return "market-trends"; // This will be your new JSP
    }

    // 1. Entry Choice Page
    @GetMapping("/choice")
    public String marketChoice(Model model) {
        List<MarketListing> latest = marketRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
        if (!latest.isEmpty()) {
            model.addAttribute("hotDeal", latest.get(0));
        }
        return "market-choice";
    }

    // 2. Show Dealer Dashboard (Add/Delete functionality)
    @GetMapping("/dealer")
    public String showDealerPage(Model model) {
        List<MarketListing> listings = marketRepo.findAll();
        model.addAttribute("listings", listings);
        model.addAttribute("count", listings.size());
        return "market-dealer";
    }

    // 3. Save a new listing
    @PostMapping("/add-listing")
    public String addListing(@ModelAttribute MarketListing listing, RedirectAttributes ra) {
        marketRepo.save(listing);
        ra.addFlashAttribute("successMsg", "Crop listing added successfully!");
        return "redirect:/market/dealer";
    }

    // 4. Delete a listing
    @GetMapping("/delete/{id}")
    public String deleteListing(@PathVariable Long id) {
        marketRepo.deleteById(id);
        return "redirect:/market/dealer";
    }

    // ==========================================
    // FIXED: FARMER SEARCH LOGIC ADDED BELOW
    // ==========================================

    // 5. Show Farmer Search Page (Initial Load)
    @GetMapping("/farmer")
    public String showFarmerPage() {
        return "market-farmer";
    }

    // 6. Handle Search Request (Fixes the 404 Error)
    @PostMapping("/search-dealers")
    public String searchDealers(@RequestParam String crop, 
                                @RequestParam String state, 
                                @RequestParam String location, 
                                Model model) {
        
        // This queries your dealer_listings table based on the three inputs
        List<MarketListing> results = marketRepo.findByCropAndStateAndLocationContaining(crop, state, location);
        
        model.addAttribute("dealers", results);
        model.addAttribute("searchCrop", crop);
        model.addAttribute("count", results.size());
        
        return "market-farmer"; // Returns back to the same page but with data
    }
}