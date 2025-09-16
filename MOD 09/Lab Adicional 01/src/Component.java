/**
 * Interface for application components in the fintech application.
 * Provides a consistent structure for all navigable components.
 */
public interface Component {
    /**
     * Initializes the component when it becomes active.
     */
    void initialize();
    
    /**
     * Renders the component's content.
     */
    void render();
    
    /**
     * Cleans up resources when the component is deactivated.
     */
    void cleanup();
    
    /**
     * Gets the component's unique identifier.
     * @return the component name/ID
     */
    String getComponentName();
}

