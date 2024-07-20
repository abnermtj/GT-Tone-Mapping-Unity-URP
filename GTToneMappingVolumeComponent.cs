using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

[System.Serializable, VolumeComponentMenu("Custom/GTToneMapping")]
public class GTToneMappingVolumeComponent : VolumeComponent, IPostProcessComponent
{
    public BoolParameter enabled = new BoolParameter(false);

    public bool IsActive() => enabled.value;

    public bool IsTileCompatible() => false;
}
