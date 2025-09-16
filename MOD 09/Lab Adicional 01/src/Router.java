import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

/**
 * Router class for managing navigation between different components
 * in the fintech application. Facilitates smooth transitions without
 * directly coupling components.
 */
public class Router {
    private Map<String, Component> components;
    private Stack<String> navigationHistory;
    private Component currentComponent;
    private String currentRoute;
    
    /**
     * Constructor initializes the router with empty component registry
     * and navigation history.
     */
    public Router() {
        this.components = new HashMap<>();
        this.navigationHistory = new Stack<>();
        this.currentComponent = null;
        this.currentRoute = null;
    }
    
    /**
     * Registers a component with the router.
     * @param route the route identifier
     * @param component the component to register
     */
    public void registerComponent(String route, Component component) {
        if (route == null || component == null) {
            throw new IllegalArgumentException("Route and component cannot be null");
        }
        components.put(route, component);
        System.out.println("✓ Component '" + component.getComponentName() + "' registered for route: " + route);
    }
    
    /**
     * Navigates to a specific route.
     * @param route the route to navigate to
     * @return true if navigation was successful, false otherwise
     */
    public boolean navigateTo(String route) {
        if (route == null || route.trim().isEmpty()) {
            System.out.println("✗ Invalid route provided");
            return false;
        }
        
        Component targetComponent = components.get(route);
        if (targetComponent == null) {
            System.out.println("✗ Route '" + route + "' not found");
            return false;
        }
        
        // Cleanup current component if exists
        if (currentComponent != null) {
            currentComponent.cleanup();
            navigationHistory.push(currentRoute);
        }
        
        // Set new current component
        currentComponent = targetComponent;
        currentRoute = route;
        
        // Initialize and render new component
        currentComponent.initialize();
        currentComponent.render();
        
        System.out.println("✓ Navigated to: " + route);
        return true;
    }
    
    /**
     * Navigates back to the previous component in history.
     * @return true if navigation was successful, false if no history
     */
    public boolean navigateBack() {
        if (navigationHistory.isEmpty()) {
            System.out.println("✗ No previous route in history");
            return false;
        }
        
        String previousRoute = navigationHistory.pop();
        return navigateTo(previousRoute);
    }
    
    /**
     * Gets the current active route.
     * @return the current route, or null if none
     */
    public String getCurrentRoute() {
        return currentRoute;
    }
    
    /**
     * Gets the current active component.
     * @return the current component, or null if none
     */
    public Component getCurrentComponent() {
        return currentComponent;
    }
    
    /**
     * Checks if a route is registered.
     * @param route the route to check
     * @return true if route exists, false otherwise
     */
    public boolean hasRoute(String route) {
        return components.containsKey(route);
    }
    
    /**
     * Gets all registered routes.
     * @return array of registered route names
     */
    public String[] getRegisteredRoutes() {
        return components.keySet().toArray(new String[0]);
    }
    
    /**
     * Clears navigation history.
     */
    public void clearHistory() {
        navigationHistory.clear();
        System.out.println("✓ Navigation history cleared");
    }
    
    /**
     * Gets the size of navigation history.
     * @return number of routes in history
     */
    public int getHistorySize() {
        return navigationHistory.size();
    }
}

