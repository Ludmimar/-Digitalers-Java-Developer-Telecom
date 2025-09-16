/**
 * Investments component for the fintech application.
 * Manages user's investment portfolio and trading activities.
 */
public class InvestmentsComponent implements Component {
    private String componentName;
    private boolean isInitialized;
    
    public InvestmentsComponent() {
        this.componentName = "Investments";
        this.isInitialized = false;
    }
    
    @Override
    public void initialize() {
        System.out.println("📈 Initializing Investments Component...");
        // Simulate loading investment data
        System.out.println("   → Loading portfolio data");
        System.out.println("   → Fetching market prices");
        System.out.println("   → Calculating performance metrics");
        this.isInitialized = true;
        System.out.println("✓ Investments Component initialized successfully");
    }
    
    @Override
    public void render() {
        if (!isInitialized) {
            System.out.println("⚠️ Investments not initialized. Call initialize() first.");
            return;
        }
        
        System.out.println("\n" + "=".repeat(50));
        System.out.println("📈 INVESTMENT PORTFOLIO");
        System.out.println("=".repeat(50));
        System.out.println("💰 Portfolio Summary:");
        System.out.println("   • Total Value: $45,230.50");
        System.out.println("   • Today's Change: +$1,245.30 (+2.83%)");
        System.out.println("   • Total Return: +$8,230.50 (+22.25%)");
        System.out.println("\n📊 Holdings:");
        System.out.println("   • AAPL (Apple Inc.)      | 50 shares  | $8,750.00 | +12.5%");
        System.out.println("   • GOOGL (Google)         | 25 shares  | $6,875.00 | +8.2%");
        System.out.println("   • TSLA (Tesla)           | 15 shares  | $3,450.00 | +15.8%");
        System.out.println("   • SPY (S&P 500 ETF)      | 100 shares | $4,200.00 | +5.1%");
        System.out.println("   • Cash Reserve           |            | $21,955.50| 0.0%");
        System.out.println("\n🎯 Watchlist:");
        System.out.println("   • MSFT (Microsoft)       | $415.20 | +2.1%");
        System.out.println("   • AMZN (Amazon)          | $3,245.80| +1.8%");
        System.out.println("=".repeat(50));
        System.out.println("Available actions: [Buy/Sell] [Research] [Portfolio Analysis] [Back to Dashboard]");
        System.out.println("=".repeat(50) + "\n");
    }
    
    @Override
    public void cleanup() {
        System.out.println("🧹 Cleaning up Investments Component...");
        // Simulate cleanup operations
        System.out.println("   → Saving portfolio preferences");
        System.out.println("   → Clearing market data cache");
        this.isInitialized = false;
        System.out.println("✓ Investments Component cleaned up");
    }
    
    @Override
    public String getComponentName() {
        return componentName;
    }
}

