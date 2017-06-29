using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour {

	
	// Update is called once per frame
	void Update () {
		
	}

    private Material m_material;

    // Use this for initialization
    void Start()
    {
        // マテリアルの生成.
        Shader shader1 = Shader.Find("myShader");
        m_material = new Material(shader1);
        m_material.hideFlags = HideFlags.HideAndDontSave;
        m_material.shader.hideFlags = HideFlags.HideAndDontSave;
    }

    void OnPostRender()
    {
        if (m_material != null)
        {
            m_material.SetPass(0);  // マテリアルのパス0を割り当て.

            GL.PushMatrix();
            GL.LoadOrtho();   // 2D描画として処理.
            GL.Begin(GL.QUADS);
            GL.TexCoord(new Vector3(0, 0, 0));
            GL.Vertex3(0.0F, 0.0F, 0);
            GL.TexCoord(new Vector3(0, 1, 0));
            GL.Vertex3(0.0F, 1.0F, 0);
            GL.TexCoord(new Vector3(1, 1, 0));
            GL.Vertex3(1.0F, 1.0F, 0);
            GL.TexCoord(new Vector3(1, 0, 0));
            GL.Vertex3(1.0F, 0.0F, 0);
            GL.End();
            GL.PopMatrix();
        }
    }
}
