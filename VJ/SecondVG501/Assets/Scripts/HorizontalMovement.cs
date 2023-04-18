/*Move player object horizontally

Sam Covarrubias
2023-04-18
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HorizontalMovement : MonoBehaviour
{
    [SerializeField] float speed;
    [SerializeField] float limit;
    Vector3 move;
    // Start is called before the first frame update
    void Update()
    {
        move.x = Input.GetAxisRaw("Horizontal");
        
        if (transform.position.x < -limit && move.x < 0){
            move.x=0;
        } else if (transform.position.x > limit && move.x > 0){
            move.x=0;
        }
        transform.Translate(move * speed * Time.deltaTime);
    }
}
