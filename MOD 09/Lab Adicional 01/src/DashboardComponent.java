/**
 * Dashboard component for the fintech application.
 * Displays overview of user's financial information.
 */
public class DashboardComponent implements Component {
    private String componentName;
    private boolean isInitialized;
    
    public DashboardComponent() {
        this.componentName = "Dashboard";
        this.isInitialized = false;
    }
    
    @Override
    public void initialize() {
        System.out.println("📊 Initializing Dashboard Component...");
        // Simulate loading user data
        System.out.println("   → Loading user account information");
        System.out.println("   → Fetching recent transactions");
        System.out.println("   → Calculating portfolio summary");
        this.isInitialized = true;
        System.out.println("✓ Dashboard Component initialized successfully");
    }
    
    @Override
    public void render() {
        if (!isInitialized) {
            System.out.println("⚠️ Dashboard not initialized. Call initialize() first.");
            return;
        }
        
        System.out.println("\n" + "=".repeat(50));
        System.out.println("🏦 FINANCIAL DASHBOARD");
        System.out.println("=".repeat(50));
        System.out.println("💰 Account Balance: $12,450.75");
        System.out.println("📈 Portfolio Value: $45,230.50");
        System.out.println("💳 Credit Score: 785");
        System.out.println("📊 Recent Activity:");
        System.out.println("   • Salary deposit: +$3,500.00");
        System.out.println("   • Grocery purchase: -$127.45");
        System.out.println("   • Investment: +$1,200.00");
        System.out.println("=".repeat(50));
        System.out.println("Available actions: [View Transactions] [Manage Investments] [Profile Settings]");
        System.out.println("=".repeat(50) + "\n");
    }
    
    @Override
    public void cleanup() {
        System.out.println("🧹 Cleaning up Dashboard Component...");
        // Simulate cleanup operations
        System.out.println("   → Saving user preferences");
        System.out.println("   → Clearing cached data");
        this.isInitialized = false;
        System.out.println("✓ Dashboard Component cleaned up");
    }
    
    @Override
    public String getComponentName() {
        return componentName;
    }
}

