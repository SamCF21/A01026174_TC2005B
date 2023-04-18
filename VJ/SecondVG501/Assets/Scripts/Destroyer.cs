/*Eliminate prefabs when touch a destroyer

Sam Covarrubias
*/
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Destroyer : MonoBehaviour
{
   void OnCollisionEnter2D(Collision2D col){
    Destroy(col.gameObject);
   } /*para parar o detener, destruir*/
   void OnTriggerEnter2D(Collider2D col){
    Destroy(col.gameObject);
   } /*no afecta el objeto que sea trigger y sirve para checkpoints, npcs etc..*/
}
