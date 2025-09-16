import java.util.Scanner;

/**
 * Main class demonstrating the Router and ApplicationComponent
 * navigation system for the fintech application.
 */
public class Main {
    public static void main(String[] args) {
        System.out.println("🏦 Welcome to the FinTech Navigation System Demo!");
        System.out.println("This demonstrates the Router and ApplicationComponent classes.\n");
        
        // Create and initialize the fintech application
        ApplicationComponent fintechApp = new ApplicationComponent();
        fintechApp.initializeApplication();
        
        // Start the application
        fintechApp.startApplication();
        
        // Interactive navigation demo
        demonstrateNavigation(fintechApp);
        
        // Shutdown the application
        fintechApp.shutdownApplication();
    }
    
    /**
     * Demonstrates the navigation capabilities of the Router system.
     * @param app the ApplicationComponent instance
     */
    private static void demonstrateNavigation(ApplicationComponent app) {
        Scanner scanner = new Scanner(System.in);
        boolean continueDemo = true;
        
        System.out.println("\n🎮 INTERACTIVE NAVIGATION DEMO");
        System.out.println("Commands: 'dashboard', 'transactions', 'profile', 'investments', 'back', 'status', 'quit'");
        System.out.println("=".repeat(60));
        
        while (continueDemo) {
            System.out.print("\nEnter command: ");
            String command = scanner.nextLine().trim().toLowerCase();
            
            switch (command) {
                case "dashboard":
                    app.navigateToComponent("dashboard");
                    break;
                    
                case "transactions":
                    app.navigateToComponent("transactions");
                    break;
                    
                case "profile":
                    app.navigateToComponent("profile");
                    break;
                    
                case "investments":
                    app.navigateToComponent("investments");
                    break;
                    
                case "back":
                    app.navigateBack();
                    break;
                    
                case "status":
                    app.displayApplicationStatus();
                    break;
                    
                case "quit":
                case "exit":
                    continueDemo = false;
                    System.out.println("👋 Ending navigation demo...");
                    break;
                    
                default:
                    System.out.println("❌ Unknown command. Available commands:");
                    System.out.println("   • dashboard - Navigate to dashboard");
                    System.out.println("   • transactions - Navigate to transactions");
                    System.out.println("   • profile - Navigate to profile");
                    System.out.println("   • investments - Navigate to investments");
                    System.out.println("   • back - Navigate back");
                    System.out.println("   • status - Show application status");
                    System.out.println("   • quit - Exit demo");
                    break;
            }
        }
        
        scanner.close();
    }
}