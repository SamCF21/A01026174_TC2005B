/*
create copies of a ball object to fall on the game scene

Samantha Covarrubias Figueroa
2023-04-18
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThrowBalls : MonoBehaviour
{
    [SerializeField] float delay; 
    [SerializeField] GameObject ball;
    [SerializeField] float limit;

    // Start is called before the first frame update
    void Start()
    {
        //Call the specified function at regular intervals
        InvokeRepeating("CreateBall", delay, delay);
    }
    void CreateBall()
    {
        //Random position of ball
        Vector3 newPos= new Vector3(Random.Range(-limit,limit), 6, 0);
        //Creates copies of ball in prefab
        Instantiate(ball, newPos, Quaternion.identity);
    }
}
