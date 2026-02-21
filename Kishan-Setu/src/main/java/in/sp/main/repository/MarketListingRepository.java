package in.sp.main.repository;

import in.sp.main.entity.MarketListing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MarketListingRepository extends JpaRepository<MarketListing, Long> {
    
    
    // Custom query to find all listings for a specific state
    List<MarketListing> findByState(String state);
    List<MarketListing> findByCropAndStateAndLocationContaining(String crop, String state, String location);
}