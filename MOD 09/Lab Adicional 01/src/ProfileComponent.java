/**
 * Profile component for the fintech application.
 * Manages user profile and account settings.
 */
public class ProfileComponent implements Component {
    private String componentName;
    private boolean isInitialized;
    
    public ProfileComponent() {
        this.componentName = "Profile";
        this.isInitialized = false;
    }
    
    @Override
    public void initialize() {
        System.out.println("👤 Initializing Profile Component...");
        // Simulate loading user profile data
        System.out.println("   → Loading user profile information");
        System.out.println("   → Fetching account settings");
        System.out.println("   → Validating security preferences");
        this.isInitialized = true;
        System.out.println("✓ Profile Component initialized successfully");
    }
    
    @Override
    public void render() {
        if (!isInitialized) {
            System.out.println("⚠️ Profile not initialized. Call initialize() first.");
            return;
        }
        
        System.out.println("\n" + "=".repeat(50));
        System.out.println("👤 USER PROFILE");
        System.out.println("=".repeat(50));
        System.out.println("📋 Personal Information:");
        System.out.println("   • Name: John Doe");
        System.out.println("   • Email: john.doe@email.com");
        System.out.println("   • Phone: +1 (555) 123-4567");
        System.out.println("   • Member since: January 2020");
        System.out.println("\n🔐 Security Settings:");
        System.out.println("   • Two-Factor Auth: Enabled");
        System.out.println("   • Biometric Login: Enabled");
        System.out.println("   • Last Login: Today, 2:30 PM");
        System.out.println("\n⚙️ Account Preferences:");
        System.out.println("   • Currency: USD");
        System.out.println("   • Language: English");
        System.out.println("   • Notifications: Enabled");
        System.out.println("   • Dark Mode: Disabled");
        System.out.println("=".repeat(50));
        System.out.println("Available actions: [Edit Profile] [Security Settings] [Preferences] [Back to Dashboard]");
        System.out.println("=".repeat(50) + "\n");
    }
    
    @Override
    public void cleanup() {
        System.out.println("🧹 Cleaning up Profile Component...");
        // Simulate cleanup operations
        System.out.println("   → Saving profile changes");
        System.out.println("   → Clearing sensitive data");
        this.isInitialized = false;
        System.out.println("✓ Profile Component cleaned up");
    }
    
    @Override
    public String getComponentName() {
        return componentName;
    }
}

