using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SineMovement : MonoBehaviour
{
    [SerializeField] float amplitude;
    [SerializeField] float speed;
    [SerializeField] Vector3 direction;
    float angle;
    Vector3 origin; //posicion original

    void Start () {
        origin = transform.position;
    }
    // Update is called once per frame
    void Update()
    {
        transform.position = origin + direction *Mathf.Sin(angle) * amplitude;
        angle += speed * Time.deltaTime; //cuánto tiempo transcurre entre frames //cada frame se mueve el objeto y actualiza el ángulo
    }
}
