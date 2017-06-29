using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainCamera : MonoBehaviour {
    public RenderTexture source0;
    public RenderTexture source1;

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        Graphics.Blit(source0, dest);
        Graphics.Blit(source1, dest);
    }
}
