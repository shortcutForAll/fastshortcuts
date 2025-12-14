/**
 * Component Loader
 * Dynamically loads navigation and footer components
 */

(function() {
    'use strict';

    /**
     * Load HTML component into a placeholder
     * @param {string} componentPath - Path to the component HTML file
     * @param {string} placeholderId - ID of the placeholder element
     */
    async function loadComponent(componentPath, placeholderId) {
        try {
            const response = await fetch(componentPath);
            if (!response.ok) {
                throw new Error(`Failed to load component: ${componentPath}`);
            }
            const html = await response.text();
            const placeholder = document.getElementById(placeholderId);
            if (placeholder) {
                placeholder.innerHTML = html;
                return true;
            }
            return false;
        } catch (error) {
            console.error('Component loading error:', error);
            return false;
        }
    }

    /**
     * Get the correct path to components based on current page location
     * @returns {string} - Relative path to components directory
     */
    function getComponentPath() {
        const path = window.location.pathname;
        
        // Homepage
        if (path === '/' || path.endsWith('index.html')) {
            return '/components/';
        }
        
        // Shortcuts pages (e.g., /shortcuts/vscode/)
        if (path.includes('/shortcuts/')) {
            return '/components/';
        }
        
        // Pages directory (e.g., /pages/about.html)
        if (path.includes('/pages/')) {
            return '/components/';
        }
        
        // Default
        return '/components/';
    }

    /**
     * Initialize component loading
     */
    async function initComponents() {
        const componentPath = getComponentPath();
        
        // Load navigation
        const navLoaded = await loadComponent(
            `${componentPath}navigation.html`,
            'navigation-placeholder'
        );
        
        // Load footer
        const footerLoaded = await loadComponent(
            `${componentPath}footer.html`,
            'footer-placeholder'
        );

        // If components loaded successfully, initialize any JS that depends on them
        if (navLoaded && footerLoaded) {
            // Trigger custom event that other scripts can listen for
            document.dispatchEvent(new CustomEvent('componentsLoaded'));
        }
    }

    // Load components when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initComponents);
    } else {
        initComponents();
    }
})();
