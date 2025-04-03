function toggleAutoSync(obj)
    if obj.spec.syncPolicy and obj.spec.syncPolicy.automated then
        -- Remove automated sync policy
        obj.spec.syncPolicy.automated = nil
        if not next(obj.spec.syncPolicy) then
            obj.spec.syncPolicy = nil
        end
    else
        -- Add automated sync policy
        if not obj.spec.syncPolicy then
            obj.spec.syncPolicy = {}
        end
        obj.spec.syncPolicy.automated = {
            prune = true,
            selfHeal = true,
            enabled = true
        }
    end
   
    return obj
end

return toggleAutoSync(obj)