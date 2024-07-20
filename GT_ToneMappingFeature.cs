using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class FullscreenGTToneMapperRenderFeature : FullScreenPassRendererFeature
{
    public override void AddRenderPasses(
        ScriptableRenderer renderer,
        ref RenderingData renderingData
    )
    {
        var stack = VolumeManager.instance.stack;
        var customPostProcessing = stack.GetComponent<GTToneMappingVolumeComponent>();
        if (customPostProcessing == null || !customPostProcessing.IsActive())
        {
            return;
        }

        base.AddRenderPasses(renderer, ref renderingData);
    }
}
