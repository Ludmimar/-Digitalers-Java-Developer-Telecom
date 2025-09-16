/**
 * ApplicationComponent class that initializes the fintech application
 * and uses the Router to manage navigation between components.
 * This is the main orchestrator of the application.
 */
public class ApplicationComponent {
    private Router router;
    private boolean isApplicationRunning;
    private String applicationName;
    
    /**
     * Constructor initializes the fintech application.
     */
    public ApplicationComponent() {
        this.applicationName = "FinTech Navigator";
        this.isApplicationRunning = false;
        this.router = new Router();
        System.out.println("🚀 Initializing " + applicationName + "...");
    }
    
    /**
     * Initializes the fintech application model and configures the Router
     * to direct navigation within the application.
     */
    public void initializeApplication() {
        System.out.println("\n" + "=".repeat(60));
        System.out.println("🏦 FINANCIAL TECHNOLOGY APPLICATION INITIALIZATION");
        System.out.println("=".repeat(60));
        
        // Initialize the router
        System.out.println("📋 Setting up navigation system...");
        
        // Register all fintech components with the router
        registerFintechComponents();
        
        // Set up application state
        setupApplicationState();
        
        this.isApplicationRunning = true;
        
        System.out.println("✓ " + applicationName + " initialized successfully!");
        System.out.println("✓ Router configured with " + router.getRegisteredRoutes().length + " components");
        System.out.println("=".repeat(60) + "\n");
    }
    
    /**
     * Registers all fintech components with the router.
     */
    private void registerFintechComponents() {
        System.out.println("🔧 Registering fintech components...");
        
        // Register Dashboard as the main component
        router.registerComponent("dashboard", new DashboardComponent());
        
        // Register Transactions component
        router.registerComponent("transactions", new TransactionsComponent());
        
        // Register Profile component
        router.registerComponent("profile", new ProfileComponent());
        
        // Register Investments component
        router.registerComponent("investments", new InvestmentsComponent());
        
        System.out.println("✓ All fintech components registered successfully");
    }
    
    /**
     * Sets up the initial application state.
     */
    private void setupApplicationState() {
        System.out.println("⚙️ Configuring application state...");
        System.out.println("   → Setting default route to dashboard");
        System.out.println("   → Initializing user session");
        System.out.println("   → Loading user preferences");
        System.out.println("✓ Application state configured");
    }
    
    /**
     * Starts the application by navigating to the default route.
     */
    public void startApplication() {
        if (!isApplicationRunning) {
            System.out.println("⚠️ Application not initialized. Call initializeApplication() first.");
            return;
        }
        
        System.out.println("🎯 Starting " + applicationName + "...");
        System.out.println("📍 Navigating to default route: dashboard");
        
        // Navigate to the dashboard as the default route
        boolean navigationSuccess = router.navigateTo("dashboard");
        
        if (navigationSuccess) {
            System.out.println("✅ Application started successfully!");
            System.out.println("🎉 Welcome to " + applicationName + "!");
        } else {
            System.out.println("❌ Failed to start application - navigation error");
        }
    }
    
    /**
     * Navigates to a specific component using the router.
     * @param route the route to navigate to
     */
    public void navigateToComponent(String route) {
        if (!isApplicationRunning) {
            System.out.println("⚠️ Application not running. Call startApplication() first.");
            return;
        }
        
        System.out.println("🧭 Navigating to: " + route);
        boolean success = router.navigateTo(route);
        
        if (!success) {
            System.out.println("❌ Navigation failed. Available routes:");
            String[] routes = router.getRegisteredRoutes();
            for (String availableRoute : routes) {
                System.out.println("   • " + availableRoute);
            }
        }
    }
    
    /**
     * Navigates back to the previous component.
     */
    public void navigateBack() {
        if (!isApplicationRunning) {
            System.out.println("⚠️ Application not running.");
            return;
        }
        
        System.out.println("⬅️ Navigating back...");
        boolean success = router.navigateBack();
        
        if (!success) {
            System.out.println("❌ No previous route available");
        }
    }
    
    /**
     * Gets the current active route.
     * @return the current route
     */
    public String getCurrentRoute() {
        return router.getCurrentRoute();
    }
    
    /**
     * Gets the router instance for direct access if needed.
     * @return the router instance
     */
    public Router getRouter() {
        return router;
    }
    
    /**
     * Checks if the application is running.
     * @return true if application is running
     */
    public boolean isApplicationRunning() {
        return isApplicationRunning;
    }
    
    /**
     * Shuts down the application and cleans up resources.
     */
    public void shutdownApplication() {
        System.out.println("\n🛑 Shutting down " + applicationName + "...");
        
        if (router.getCurrentComponent() != null) {
            System.out.println("🧹 Cleaning up current component...");
            router.getCurrentComponent().cleanup();
        }
        
        router.clearHistory();
        this.isApplicationRunning = false;
        
        System.out.println("✅ " + applicationName + " shut down successfully");
        System.out.println("👋 Thank you for using " + applicationName + "!");
    }
    
    /**
     * Displays application status and available routes.
     */
    public void displayApplicationStatus() {
        System.out.println("\n" + "=".repeat(50));
        System.out.println("📊 APPLICATION STATUS");
        System.out.println("=".repeat(50));
        System.out.println("Application: " + applicationName);
        System.out.println("Status: " + (isApplicationRunning ? "🟢 Running" : "🔴 Stopped"));
        System.out.println("Current Route: " + (router.getCurrentRoute() != null ? router.getCurrentRoute() : "None"));
        System.out.println("Navigation History: " + router.getHistorySize() + " entries");
        System.out.println("\nAvailable Routes:");
        String[] routes = router.getRegisteredRoutes();
        for (String route : routes) {
            System.out.println("   • " + route);
        }
        System.out.println("=".repeat(50) + "\n");
    }
}

