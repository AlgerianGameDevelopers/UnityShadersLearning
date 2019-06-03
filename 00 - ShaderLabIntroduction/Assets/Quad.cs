using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode] // this attribute is used to let the script execute in edit mode
[RequireComponent(typeof(MeshRenderer),typeof(MeshFilter))] // required components are automatically added when the script is added to a game object
public class Quad : MonoBehaviour
{
    List<Vector3> vertices; // list of vertices
    List<int> indices;      // contain the ordered indices to draw triangles from vertices list
    List<Color> colors;     // list of colors passed to vertices

    MeshFilter mf;  
    void Start()
    {
        mf = GetComponent<MeshFilter>();

        Mesh quad = new Mesh();

        // vertices for the quad geometry
        vertices = new List<Vector3>(
            new Vector3[]
            {
                new Vector3(-1, -1, 0),
                new Vector3(-1, 1, 0),
                new Vector3(1, -1, 0),
                new Vector3(1, 1, 0),
            });
        // triangle vertices index
        indices = new List<int>(
            new int[]
            {
                0,1,2,
                2,1,3
            });

        colors = new List<Color>(
            new Color[]
            {
                Color.red,
                Color.green,
                Color.blue,
                Color.yellow
            });

        quad.SetVertices(vertices);
        quad.SetTriangles(indices.ToArray(), 0);
        quad.SetColors(colors);

        mf.mesh = quad;
    }
}
