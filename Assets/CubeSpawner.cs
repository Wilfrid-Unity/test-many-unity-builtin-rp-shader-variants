using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CubeSpawner : MonoBehaviour
{
    public GameObject sphere;

    public static readonly string[] rKeywords = 
    {
        "CHANNEL_R_OUTPUT_0_0",
        "CHANNEL_R_OUTPUT_0_1",
        "CHANNEL_R_OUTPUT_0_2",
        "CHANNEL_R_OUTPUT_0_3",
        "CHANNEL_R_OUTPUT_0_4",
        "CHANNEL_R_OUTPUT_0_5",
        "CHANNEL_R_OUTPUT_0_6",
        "CHANNEL_R_OUTPUT_0_7",
        "CHANNEL_R_OUTPUT_0_8",
        "CHANNEL_R_OUTPUT_0_9",
        "CHANNEL_R_OUTPUT_1_0",
    };

    public static readonly string[] gKeywords =
    {
        "CHANNEL_G_OUTPUT_0_0",
        "CHANNEL_G_OUTPUT_0_1",
        "CHANNEL_G_OUTPUT_0_2",
        "CHANNEL_G_OUTPUT_0_3",
        "CHANNEL_G_OUTPUT_0_4",
        "CHANNEL_G_OUTPUT_0_5",
        "CHANNEL_G_OUTPUT_0_6",
        "CHANNEL_G_OUTPUT_0_7",
        "CHANNEL_G_OUTPUT_0_8",
        "CHANNEL_G_OUTPUT_0_9",
        "CHANNEL_G_OUTPUT_1_0",
    };

    public static readonly string[] bKeywords =
    {
        "CHANNEL_B_OUTPUT_0_0",
        "CHANNEL_B_OUTPUT_0_1",
        "CHANNEL_B_OUTPUT_0_2",
        "CHANNEL_B_OUTPUT_0_3",
        "CHANNEL_B_OUTPUT_0_4",
        "CHANNEL_B_OUTPUT_0_5",
        "CHANNEL_B_OUTPUT_0_6",
        "CHANNEL_B_OUTPUT_0_7",
        "CHANNEL_B_OUTPUT_0_8",
        "CHANNEL_B_OUTPUT_0_9",
        "CHANNEL_B_OUTPUT_1_0",
    };

    // Start is called before the first frame update
    void Start()
    {
        for(int i = 0; i <= 10; ++i)
        for(int j = 0; j <= 10; ++j)
        for(int k = 0; k <= 10; ++k)
        {
            Vector3 newSpherePosition = new Vector3(-5 + 2*i, -5 + 2*j, -5 + 2*k);
            GameObject newSphere = Instantiate(sphere, newSpherePosition, Quaternion.identity );
            newSphere.GetComponent<Renderer>().material.EnableKeyword(rKeywords[i]);
            newSphere.GetComponent<Renderer>().material.EnableKeyword(gKeywords[j]);
            newSphere.GetComponent<Renderer>().material.EnableKeyword(bKeywords[k]);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
