function toggleAutoSync(obj)
    -- Print current state for debugging
    print("Input object:", obj)
    print("Current spec:", obj.spec)
    print("Current sync policy:", obj.spec.syncPolicy)
    
    -- Create a new object with the same metadata
    local newObj = {
        apiVersion = obj.apiVersion,
        kind = obj.kind,
        metadata = obj.metadata,
        spec = {
            source = obj.spec.source,
            destination = obj.spec.destination,
            project = obj.spec.project
        }
    }
    
    -- Get current enabled state
    local currentEnabled = false
    if obj.spec.syncPolicy and obj.spec.syncPolicy.automated then
        currentEnabled = true
    end
    
    print("Current enabled state:", currentEnabled)
    
    -- Toggle automated sync
    if not currentEnabled then
        -- If currently disabled, add syncPolicy with automated section
        newObj.spec.syncPolicy = {
            automated = {
                enabled = true,
                prune = false,
                selfHeal = false
            }
        }
    end
    -- If currently enabled, we don't add syncPolicy at all
    
    print("New object:", newObj)
    print("New spec:", newObj.spec)
    print("New sync policy:", newObj.spec.syncPolicy)
    
    return newObj
end

return toggleAutoSync(obj)