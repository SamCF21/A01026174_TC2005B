/*Keep track of score*/
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Score : MonoBehaviour
{
    [SerializeField] TMP_Text scoreText;
    [SerializeField] ParticleSystem particles;
    int points;

    // Start is called before the first frame update
    void Start()
    {
        points=0;
    }

    void OnTriggerEnter2D (Collider2D col){
        points +=1;
        scoreText.text= "Score: " + points;
        particles.Emit(15);
        //Instantiate(particles,transform.position, Quaternion.identity);
        Destroy(col.gameObject);
    }
}
