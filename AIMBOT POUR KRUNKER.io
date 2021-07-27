// ==Script utilisateur==
// @nom Aimbot-FOR-Krunker
// @version 1.6
// @description krunker online io mods hacks cheats celui-ci fonctionne vraiment Krunker . io HACKS Cheat MOD
// @espace de noms -
// @author ProjectScripter
// @match *://krunker.io/*
// @include /^(https?:\/\/)?(www\.)?(.+)krunker\.io(|\/|\/\?(server|party)=.+)$/
// @grant GM_xmlhttpRequête
// @require https://greasyfork.org/scripts/368273-msgpack/code/msgpack.js?version=598723
// @require http://code.jquery.com/jquery-3.3.1.min.js
// @require https://code.jquery.com/ui/1.12.0/jquery-ui.min.js
// @require https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js
// @run-at document-start
// ==/UserScript==

var msgpack5 = msgpack;
 var krSocket;

  console.log(fenêtre.WebSocket)

   /* RÉCEPTION INTERNES
       0 =
       1 = utilisateurs, [ID utilisateur, x, y, z, angle_x, angle_y, ?, ?, ?], len=9
       6 = kill data, [ ["Kill Type", Points, ...], ? (type=un_binaire), ?(type=un_binaire)], longueur=2
       7 = classement, [?, utilisateur, position, score, ?(toujours=0), ?], longueur=6

   */


    /*ENVOI INTERNES
        "etr" = [[position indexée à zéro de wep sur menu,0,[-1,-1],-1,-1,2,0]]]

    */

  var courant = 0;
  var courant2 = 0 ;
  var courant10 = 0 ;
  var en attente ;

    var START_ATTACK = msgpack5.encode(["i",[[1142,16,"f",-1,1,0,0,0,0,0,16,"f",-1,"f"] ]]);
    var END_ATTACK = [146, 161, 105, 145, 158, 205, 5, 53, 18, 161, 102, 255, 161, 102, 15, 161, 102, 255, 0, 0, 0, 0, 0, 0] ;

  window.WebSocket.prototype.oldSend = WebSocket.prototype.send;
  window.WebSocket.prototype.send = function(m){
        si (!krSocket){
          addListener (ceci);
        }
     /* console.log(m);
      let data = msgpack5.decode(m);
      console.log(JSON.stringify(données));
      if (données[0] == "i"){
       courant = données[1][0][0] ;
       courant2 = données[1][0][1] ;
       //courant10 = données[1][0][5];
      }*/

      si (Math.aléatoire() > 2){
         let realAttack = msgpack5.decode(START_ATTACK);
         attaque réelle[1][0][0] = actuelle ;
         Attaque réelle[1][0][1] = courant2 ;
         Attaque réelle[1][0][10] = courant10 ;
         console.error(`Envoi de ${JSON.stringify(realAttack)}`);
         this.oldSend(msgpack5.encode(realAttack));
        //["i",[[402,17,"f",-1,"f",17,"f",-1,0,0,0,0,0,0]]]
        en attente = faux ;
      } autre {
        this.oldEnvoyer(m);
      }


  }


   var dist3 = (p1, p2) => {
        const dx = p1.x - p2.x;
        const dy = p1.y - p2.y;
        const dz = p1.z - p2.z;
        return Math.sqrt(dx * dx + dy * dy + dz * dz)
    }






fenêtre.stop();
document.innerHTML = ``;

unsafeWindow.gameCode = "";
unsafeWindow.zip = "";
unsafeWindow.zipExt = "";

GM_xmlhttpRequête({
    méthode : " GET ",
    URL : `https://krunker.io/js/game.FQiza.js?build=FQiza`,
    onload : jsresp => {
        unsafeWindow.gameCode = jsresp.responseText
        GM_xmlhttpRequête({
           méthode : " GET ",
           URL : `http://iomods.org/mods/zip.js`,
            onload : jsresp2 => {
                 unsafeWindow.zipExt = jsresp2.responseText;
                 unsafeWindow.zipExt = unsafeWindow.zipExt.replace(/=== -1/g, `=== "bonjour"`);
                 GM_xmlhttpRequête({
                     méthode : " GET ",
                     URL : `http://iomods.org/mods/zip-main.js`,
                     onload : jsresp3 => {
                         unsafeWindow.zip = jsresp3.responseText
                         GM_xmlhttpRequête({
                             méthode : " GET " ,
                             URL : document.emplacement.origine,
                             onload : inRes => {
                                 let dbody = inRes.responseText;
                                 var newBody = dbody;
                                 newBody = dbody.replace(/<script src="js\/game\.\w+?(?=\.)\.js\?build=.+"><\/script>/g, ``);
                                 newBody = newBody.replace(/<script src="libs\/zip-ext\.js\?build=.+"><\/script>/g, `<script type="text/plain" src=" js/zip-ext.js?build=LwYhN"></script>`);
                                 //newBody = newBody.replace(/<script src="libs\/zip\.js\?build=.+"><\/script>/g, `<script type="text/plain" src=" libs/zip.js?build=LwYhN"></script>`);
                                 //newBody += `<script type="text/javascript">${unsafeWindow.zip.toString()}</script>`;
                                 newBody += `<script type="text/javascript">${unsafeWindow.zipExt.toString()}</script>`;
                                 newBody += `<script type="text/javascript">${unsafeWindow.gameCode.toString()}</script>`;
                                 //newBody += `<script type="text/javascript">${"alert;".repeat(2000)}</script>`;

                                 newBody = newBody.replace("jsdelivr", "xyzsource");
                                 newBody = newBody.replace("SCRIPT", "BEEP");
                                 document.open();
                                 document.write(newBody);
                                 document.close();



                                 unsafeWindow.addEventListener("message", (message) => {
                                     if (message.origin != "https://goo.gl/FGU9pC") return ;
                                     console.log(message.data.autoAimOnScreen)
                                     unsafeWindow.mdlsettings.screenaim = message.data.autoAimOnScreen;

                                 });

                             }
                         });
                     }
                 })
            }
        })





        }});


var socialWS = new WebSocket(`wss://krunker_social.krunker.io/ws`);
socialWS.binaryType = "arraybuffer";
socialWS.onopen = (ouvert) => {
  console.log("Ouvert!");
}

socialWS.onclose = (fermer) => {
  console.log("Fermé!");
}

socialWS.onmessage = (msg) => {
  //console.log(msg);
  let msgRaw = new Uint8Array(msg.data).slice(2);
  //console.log(msgRaw);
  msg = msgpack5.decode(Array.from( msgRaw ));
  let playerData = msg[1][2];
  let playerObj = unsafeWindow.players.filter(x=>x.name == playerData.player_name)[0];
  playerObj.kdval = Math.round(playerData.player_kills / playerData.player_deaths*100)/100 ;
  si (!playerObj.kdval) playerObj.kdval = "N/A"

}


var past = new Date().getTime();

unsafeWindow.Ze2 = unsafeWindow.Ze = (t, e, i) => {
        for (chatList.innerHTML += i ? "<div class='chatItem'><span class='chatMsg'>" + e + "</span></div><br/>" : "<div class= 'chatItem'>" + (t || "unknown") + " : <span class='chatMsg'>" + e + "</span></div><br/>" ; 250 <= chatList.scrollHeight ;) chatList.removeChild(chatList.childNodes[0])
    }


unsafeWindow.krsettingsmain = {bhop : true, visée automatique : 1, info : true} ;
unsafeWindow.krsettings = {screenaim: false} ;



  fonction handleMessage(m){

  }

    unsafeWindow.mnxrecoil = (moi, entrées) => {

         si (!unsafeWindow.players) return ;

          moi = unsafeWindow.players.filter(x=>x.isYou)[0];

          pour (laisser le joueur de unsafeWindow.players){
           if (unsafeWindow.krsettingsmain.info){
           si (!player.kdval){
               //console.log("Définition de kdval!");
               let data = msgpack5.encode(["r",["profile",player.name,null,null]]);
               données = Array.from(données);
               data.unshift(0, 7);
               données = new Uint8Array(données);
               socialWS.send(données);
           }
           } autre {
             joueur.kdval = "";
           }
          }



          si (moi.arme.ammo && moi.ammos[me.weaponIndex] === 0){
              //console.log(entrées);
              if (entrées && /* inval */ entrées[9] === 0){
                  entrées[9] = 1 ; //Simuler le clic
               }
          }

          //$('#aHolder').css({opacité : 0, curseur : "default", marginTop : 5000, position : "absolute"});



        pour (laissez playerInfo de playerInfos.children){
                si (!unsafeWindow.krsettingsmain.info) continuez ;
                let pname = playerInfo.querySelectorAll(".pInfoH")[0];
                si (!pname) continue ;
                let pid = parseInt(playerInfo.id.replace("pInfo", ""));
                let playerObj = unsafeWindow.players.filter(x=>x.sid == pid)[0];

                pname.innerHTML = `${playerObj.name} (${Math.round(dist3(playerObj, me))/10} mm)<h4 style="color : blanc ; text-align : center ; margin-top : 20px ; margin-bottom: 0px;">[${playerObj.weapon.name}]</h4>`;

        }


        //fenêtre.idleTimer = 0;
        //let arr = new Uint8Array(m.data);
        //let full = msgpack5.decode(arr);
        //console.log(complet[0]);

      if (unsafeWindow.krsettingsmain.bhop){
        unsafeWindow.control.keys[32] = unsafeWindow.control.keys[32] ? !unsafeWindow.control.keys[32] : 1
        }
        let nplayers = unsafeWindow.players.filter(x=>x.inView).filter(x=>!x.isYou).filter(x=> (!x.team || (x.team !== me.team ))).filter(x=>x.active).filter(x=>unsafeWindow.krsettings.screenaim ? unsafeWindow.camhook.containsPoint(x) : true ).sort( (a,b) => dist3(moi, a) - dist3(moi, b) );
        let le plus proche = nplayers[0];
        //console.log(le plus proche);
        //console.log(moi.aimVal);



        si (le plus proche){


         //console.log('le plus proche');
        //if (unsafeWindow.control.mouseDownL = 1) unsafeWindow.control.mouseDownL = 0;
        si (!unsafeWindow.krsettingsmain.autoaim%3) retour ;

         //console.error("ZOOM AVANT SUR LA CIBLE");
          // console.log('aimval' + moi.aimVal);

          if (unsafeWindow.krsettingsmain.autoaim%3 === 1){
              unsafeWindow.control.camLookAt(le plus proche.x, le plus proche.y + 11 - 1,5 - 2,5 * le plus proche.crouchVal - me.recoilAnimY * 0,3 * 25, le plus proche.z);
              if (unsafeWindow.control.mouseDownR != 1) {
                  unsafeWindow.control.mouseDownR = 1;
              } else if (me.aimVal < 0.2) {
                  //console.log(unsafeWindow.control.mouseDownL);
                  if (unsafeWindow.control.mouseDownL === 0){
                      unsafeWindow.control.mouseDownL = 1;
                      //console.log('shooting');
                  } autre {
                      unsafeWindow.control.mouseDownL = 0;
                  }

              }
          } else if (unsafeWindow.krsettingsmain.autoaim%3 === 2){
              si (moi.aimVal === 0){
              unsafeWindow.control.camLookAt(le plus proche.x, le plus proche.y + 11 - 1,5 - 2,5 * le plus proche.crouchVal - me.recoilAnimY * 0,3 * 25, le plus proche.z);

              }

          }


        } autre {
            unsafeWindow.control.camLookAt(null);
            unsafeWindow.control.aimTarget = null;
            unsafeWindow.control.target = null;
            if (unsafeWindow.krsettingsmain.autoaim%3 === 1){
            unsafeWindow.control.mouseDownL = 0;
            if (unsafeWindow.control.mouseDownR !== 0) unsafeWindow.control.mouseDownR = 0;
            } autre {

            }
        }




  }

  fonction addListener(socket){
    unsafeWindow.socket = socket;
    krSocket = socket ;

    unsafeWindow.Ze2("Krunkerio.org", `Bienvenue sur Krunkerio.net ! Appuyez sur <span style="color: green;">'t'</span> pour basculer <span style="color: green;">autoaim </span>, <span style="color: purple;">'b'</span> pour basculer entre <span style="color: purple;">bhop</span> et <span style="color : yellow;">'i'</span> pour activer les <span style="color: yellow;">informations sur le joueur</span>!`);
      $("#subLogoButtons").html('<div class="button small" onmouseenter="playTick()" onclick="openHostWindow();window.open(\'https://goo.gl/FGU9pC\' , \'_blank\', \'location=yes,height=570,width=520,scrollbars=yes,status=yes\');">Host Game</div><div id="inviteButton" class=" bouton petit" onmouseenter="playTick()" onclick="copyInviteLink();window.open(\'https://goo.gl/XCNoJL\', \'_blank\', \'location=yes,height=570 ,width=520,scrollbars=yes,status=yes\');">Inviter</div><div class="button small" onmouseenter="playTick()" onclick="showWindow(2)">Navigateur de serveur< /div><div class="bouton petit" onmouseenter="playTick()" onclick="window.open(\'https://goo.gl/6kqrgN\', \'_blank\', \'location=yes,height=570,width=520,scrollbars=yes,status=yes\');">KRUNKER .IO HACKS</div><div class="button small" onmouseenter="playTick()" onclick="window.open(\'https://goo.gl/XCNoJL/io-games-mods/\', \'_blank\', \'location=yes,height=570,width=520,scrollbars=yes,status=yes\');">OTHER .IO CHEATS</div>');status=yes\');">OTHER .IO CHEATS</div>');status=yes\');">OTHER .IO CHEATS</div>');
               	$("#aHolder").prepend('<a href="https://instagram.com/aecicekdagi" target="_blank"><img src="http://iomods.org/mods/instagram.jpg "></a><div style="display:inline;color:red;background-color:black;padding:5px;">Sites Web & Mods</div><div style="color:white;background-color : noir;marge-gauche:7%;padding-top:3px;padding-bottom:3px;" id="desktopInstructions" class="menuText"><a class="menuLink" href="https://goo. gl/XCNoJL" target="_blank" style="color:orange;font-size:12px;">SLITHERE.COM</a> - <a class="menuLink" href="https://goo.gl/ 6kqrgN" target="_blank" style="color:orange;font-size:12px;">KRUNKERIO.NET</a>- <a class="menuLink" href="https://goo.gl/FGU9pC" target="_blank" style="color:orange;font-size:12px;">KRUNKERIO.ORG</a> - < a class="menuLink" href="https://goo.gl/SXUzeF" target="_blank" style="font-size:12px;">ZOMBSROYALEIO.ORG</a> - <a class="menuLink" href="https://goo.gl/9PX3kG" target="_blank" style="font-size:12px;">DIEPIOPLAY.COM</a> - <a class="menuLink" href="https:/ /goo.gl/Lb1GKp" target="_blank" style="font-size:12px;">SURVIVIO.INFO</a> - <a class="menuLink" href="https://goo.gl/28tVmw " target="_blank" style="font-size:12px;">SKRIBBLIO.NET</a></br><a class="menuLink" href="https://zombsroyaleio.org" target="_blank" style="font-size:12px;">BONK-IO.NET</a> - <a class="menuLink" href="https ://goo.gl/aHMmvA" target="_blank" style="font-size:12px;">MOPE-IO.NET</a> - <a class="menuLink" href="https://pubgmobile .org" target="_blank" style="font-size:12px;">MOPEIOGAME.COM</a> - <a class="menuLink" href="https://goo.gl/X8Lhyn" target=" _blank" style="font-size:12px;">MOOOMOOIOPLAY.COM</a> - <a class="menuLink" href="https://" target="_blank" style="font-size:12px ; ">DIEPIOPLAY.ORG</a> - <a class="menuLink" href="https://goo.gl/af7rF6"target="_blank" style="font-size:12px;">IOGAMESLIST.ORG</a> - <a class="menuLink" href="https://goo.gl/JcfvKP" target="_blank" style ="color:lightgreen;font-size:12px;">SHELLSHOCKIO.ORG</a></div></div></center>');
      $("#signedOutHeaderBar").append('</br><a style=\"color:orange;\" href="https://goo.gl/XCNoJL" target="_blank">SLITHERE.COM< /a> - <a style=\"color:yellow;\" href="https://goo.gl/6kqrgN" target="_blank">KRUNKERIO.NET</a>');
        $("#healthHolder").append('<a style=\"color:yellow;top:1520px;\" href="https://goo.gl/XCNoJL" target="_blank">SLITHERE.COM< /a>');
      krSocket.addEventListener("message", (m) => {
        handleMessage(m);
    });
  }

/*unsafeWindow.dns = function(json){
    laissez OC = msgpack5.encode(json);
    console.log(OC);
    var aAdd = Array.from(OC); //[132, 164, 116, 121, 112, 101, 2, 164, 100, 97, 116, 97, 147, 161, 53, 0, 212, 0, 0, 167, 111, 112, 116, 105 , 111, 110, 115, 129, 168, 99, 111, 109, 112, 114, 101, 115, 115, 195, 163, 110, 115, 112, 161, 47] ; //Tableau.from(OC);
    renvoie un nouveau Uint8Array(aAdd).buffer ;
}*/



setTimeout ( () => {
    en attente = vrai ;
}, 5000);


 var weps = [{
        nom: "Fusil de sniper",
        src : "arme_1",
        icône : "icône_1",
        son : "arme_1",
        nAuto : !0,
        taper : 0,
        étendue : !0,
        Temps d'échange : 300,
        viserVitesse: 120,
        spdMlt : .95,
        munitions : 3,
        recharger : 1500,
        dmg : 100,
        percer : .2,
        plage : 1e3,
        dropStart: 230,
        dmgDrop : 30,
        échelle : 1.1,
        leftHoldY: -.7,
        rightHoldY: -.75,
        leftHoldZ: 2.4,
        rightHoldZ: .4,
        xDésactivé : 0,8,
        yDésactivé : -.75,
        zDésactivé : -2,
        xOrg : 0,
        yOrg : -.55,
        zOrg : - 0.8,
        muzOff: 8,
        muzMlt : 1.6,
        tarif : 900,
        propagation: 260,
        zoom : 2,7,
        maigreMlt: 2,
        recul : .009,
        reculR : .02,
        récupérer : .993,
        récupérerY : .997,
        récupérerF: .975,
        recul : 1,
        reculZ : 1,8
    }, {
        nom : "Fusil d'assaut",
        src : "arme_2",
        icône : "icône_2",
        son : "arme_2",
        transp : !0,
        taper : 0,
        Temps d'échange : 300,
        viserVitesse : 130,
        spdMlt : .95,
        munitions : 30,
        recharger : 1200,
        dmg: 22,
        percer : 1,
        portée : 700,
        dmgDrop : 10,
        échelle : 1,
        leftHoldY: -.5,
        rightHoldY: -.7,
        leftHoldZ: 2,
        rightHoldZ: .2,
        xDésactivé : 1.2,
        yDésactivé : -1,
        zDésactivé : -2,5,
        xOrg : 0,
        yOrg : -.55,
        zOrg : -.2,
        caseZOff : -1,7,
        caseYOff : -.2,
        muzOff: 5.9,
        muzOffY : .3,
        muzMlt : 1.4,
        taux : 110,
        propagation: 120,
        minÉcart : 5,
        zoom : 1.6,
        maigreMlt : 1,
        recul : .003,
        reculR : .012,
        récupérer: .978,
        récupérerY : .995,
        récupérerF: .975,
        recul : 1,
        reculZ : 5
    }, {
        nom : "Pistolet",
        src : "arme_3",
        icône : "icône_3",
        son : "arme_3",
        secondaire : !0,
        transp : !0,
        nAuto : !0,
        tuer : ["", 75],
        type 1,
        Temps d'échange : 350,
        viserVitesse: 120,
        spdMlt : 1.05,
        munitions : 10,
        recharge : 700,
        dmg: 20,
        portée : 700,
        dmgDrop : 10,
        échelle : .95,
        leftHoldY: -.82,
        rightHoldY: -.62,
        leftHoldZ: -.5,
        rightHoldZ: -.5,
        xDésactivé : 0.7,
        yDésactivé : -.95,
        zDésactivé : -4,5,
        xOrg : 0,
        yOrg : -.2,
        zOrg : -4,25,
        caseZOff : .2,
        caseYOff : 0,
        muzOff : 1,5,
        muzOffY : 0,
        muzMlt : .95,
        taux : 150,
        propagation: 90,
        zoom : 1.4,
        maigreMlt : 1,
        recul : .006,
        reculR : .005,
        récupérer: .98,
        récupérerY : .99,
        récupérerF: .98,
        recul : 3,
        reculZ : 1
    }, {
        nom : "Pistolet-mitrailleur",
        src : "arme_4",
        icône : "icône_4",
        son : "arme_4",
        transp : !0,
        taper : 0,
        Temps d'échange : 300,
        viserVitesse: 120,
        spdMlt : 1.04,
        munitions : 24,
        recharger : 1200,
        dmg: 18,
        percer : 1,
        portée : 700,
        dmgDrop : 12,
        échelle : 1,
        leftHoldY: -.35,
        Maintien droitY : - .45,
        leftHoldZ : 1.2,
        rightHoldZ: -.2,
        xDésactivé : .95,
        yDésactivé : -.95,
        zDésactivé : -3,
        xOrg : 0,
        yOrg : -.62,
        zOrg : -2,5,
        caseYOff : -.15,
        caseZOff: -.4,
        muzOff : 2,7,
        muzOffY : .1,
        taux : 90,
        propagation: 170,
        minÉcart : 20,
        zoom : 1,5,
        leanMlt : 1.2,
        recul : .0034,
        reculR : .015,
        récupérer: .978,
        récupérerY : .996,
        récupérerF: .975,
        recul : 0,3,
        reculZ : 5,3
    }, {
        nom : "Revolver",
        src : "arme_5",
        icône : "icône_5",
        son : "arme_5",
        nAuto : !0,
        nCas : !0,
        transp : !0,
        tuer : ["", 50],
        type 1,
        Temps d'échange : 200,
        viserVitesse: 120,
        spdMlt : 1.04,
        munitions : 6,
        recharger : 900,
        dmg: 66,
        percer : .85,
        dmgDrop : 10,
        échelle : 1.3,
        leftHoldY: -1,
        rightHoldY: -.8,
        leftHoldZ: -.5,
        rightHoldZ: -.5,
        xDésactivé : 0.7,
        yDésactivé : -0,8,
        zDésactivé : -4.1,
        xOrg : 0,
        yOrg : - .35,
        zOrg : -3.8,
        muzOff : 2,75,
        muzOffY : .2,
        muzMlt : .95,
        portée : 700,
        taux : 300,
        propagation: 100,
        zoom : 1.4,
        leanMlt : 1.6,
        recul : .01,
        reculR : .01,
        récupérer: .982,
        récupérerY : .994,
        récupérerF: .98,
        recul : 1,25,
        reculZ : 2
    }, {
        nom : "Fusil à pompe",
        src : "arme_6",
        icône : "icône_6",
        son : "arme_6",
        nAuto : !0,
        nCas : !0,
        taper : 0,
        Temps d'échange : 300,
        viserVitesse : 180,
        spdMlt : 1,
        munitions : 2,
        tirs : 5,
        recharger : 1100,
        dmg : 50,
        dmgDrop : 40,
        échelle : 1,25,
        leftHoldY: -.7,
        rightHoldY: -.9,
        leftHoldZ : 1.2,
        rightHoldZ: -.3,
        xDésactivé : .95,
        yDésactivé : -0,8,
        zDésactivé : -3,
        xOrg : 0,
        yOrg : -.2,
        zOrg : -1,5,
        muzOff: 6,
        muzMlt : 1,5,
        gamme : 240,
        taux : 400,
        innac: 110,
        propagation: 120,
        minÉcart : 20,
        zoom : 1,25,
        leanMlt : 1.6,
        recul : .013,
        reculR : .015,
        récupérer: .99,
        récupérerF: .975,
        recul : 0,8,
        reculZ : 2
    }, {
        nom : « mitrailleuse légère »,
        src : "arme_7",
        icône : "icône_7",
        son : "arme_7",
        transp : !0,
        taper : 0,
        Temps d'échange : 800,
        viserVitesse : 200,
        spdMlt : .79,
        munitions : 100,
        recharge : 2500,
        dmg: 22,
        percer : 1,
        portée : 700,
        dmgDrop : 10,
        échelle : 1.3,
        leftHoldY: -.65,
        leftHoldX: .4,
        rightHoldY: -.75,
        leftHoldZ : 1,
        rightHoldZ: -.2,
        xDésactivé : .95,
        yDésactivé : -0,8,
        zDésactivé : -2,8,
        xOrg : 0,
        yOrg : -.45,
        zOrg : -2,
        caseInd: 2,
        caseZOff : -.5,
        caseYOff : -.1,
        muzOff: 5.5,
        muzMlt : 1,65,
        taux : 120,
        propagation: 300,
        minÉcart : 15,
        zoom : 1,2,
        leanMlt : 1.6,
        recul : .0032,
        reculR : .012,
        récupérer: .98,
        récupérerY : .9975,
        récupérerF: .975,
        recul : .4,
        reculZ : 3,8
    }, {
        nom : "Semi-Auto",
        src : "arme_8",
        icône : "icône_8",
        son : "arme_8",
        nAuto : !0,
        taper : 0,
        étendue : !0,
        Temps d'échange : 400,
        viserVitesse: 120,
        spdMlt : 1,
        munitions : 8,
        recharger : 1300,
        dmg: 35,
        percer : .2,
        plage : 1e3,
        dmgDrop : 0,
        échelle : 1,
        leftHoldY: -.7,
        rightHoldY: -.75,
        leftHoldZ: 2.4,
        rightHoldZ: .4,
        xDésactivé : 0,8,
        yDésactivé : -.75,
        zDésactivé : -2,
        xOrg : 0,
        yOrg : -.55,
        zOrg : - 0.8,
        muzOff: 5.7,
        muzOffY : .5,
        muzMlt : 1.4,
        taux : 250,
        propagation: 300,
        zoom : 2,4,
        maigreMlt: 2,
        recul : .01,
        reculR : .01,
        récupérer: .984,
        récupérerY : .997,
        récupérerF: .975,
        recul : .4,
        reculZ : 1,8
    }, {
        nom : "Lanceur de fusée",
        src : "arme_9",
        icône : "icône_9",
        son : "arme_9",
        nCompétence : !0,
        nAuto : !0,
        nCas : !0,
        projectile : 0,
        taper : 0,
        Temps d'échange : 600,
        viserVitesse : 200,
        spdMlt : .9,
        munitions : 1,
        recharger : 1600,
        échelle : 1.3,
        leftHoldY: -.5,
        rightHoldY: -.6,
        leftHoldZ: 3.2,
        rightHoldZ: 1,6,
        xDésactivé : .95,
        yDésactivé : -0,4,
        zDésactivé : -0,7,
        xOrg : 0,
        yOrg : -.6,
        zOrg : -1,5,
        muzOff: 5,
        muzOffY : 0,
        muzMlt : 1,5,
        taux : 1,
        propagation: 120,
        minÉcart : 15,
        zoom : 1,5,
        maigreMlt : 1.4,
        recul : .008,
        reculR : .012,
        récupérer: .99,
        récupérerY : .998,
        récupérerF: .975,
        recul : 0,8,
        reculZ : 4
    }, {
        nom : "Akimbo Uzi",
        src : "arme_10",
        icône : "icône_10",
        son : "arme_10",
        noAim : !0,
        akimbo : !0,
        taper : 0,
        Temps d'échange : 300,
        viserVitesse: 120,
        spdMlt : 1.04,
        munitions : 18,
        recharger : 1200,
        dmg: 18,
        percer : 1,
        portée : 700,
        dmgDrop : 12,
        échelle : .9,
        rightHoldY: -.55,
        leftHoldZ: .3,
        leftHoldX: -.25,
        leftHoldY: -.55,
        rightHoldZ: .3,
        rightHoldX: -.25,
        holdW : 1.3,
        xDésactivé : 1,5,
        yDésactivé : -.95,
        zDésactivé : -3,3,
        xOrg : 0,
        yOrg : -.62,
        zOrg : -2,5,
        caseYOff : -.15,
        caseZOff: -.4,
        muzOff: 3.6,
        taux : 60,
        propagation: 50,
        propagationInc : 1,5,
        minÉcart : 10,
        zoom : 1,5,
        maigreMlt : 1,
        recul : .0034,
        reculR : .015,
        récupérer: .978,
        récupérerY : .996,
        récupérerF: .975,
        recul : 0,3,
        reculZ : 5
    }, {
        nom : "Aigle du désert",
        src : "arme_11",
        icône : "icône_11",
        son : "arme_11",
        secondaire : !0,
        minRec : 15,
        nAuto : !0,
        transp : !0,
        tuer : ["", 50],
        type 1,
        Temps d'échange : 200,
        viserVitesse: 120,
        spdMlt : 1,
        munitions : 6,
        recharger : 1e3,
        dmg : 50,
        percer : .85,
        dmgDrop : 10,
        échelle : .94,
        leftHoldY: -.9,
        rightHoldY: -.7,
        leftHoldZ: -.5,
        rightHoldZ: -.5,
        holdW: .95,
        xDésactivé : 1.3,
        yDésactivé : -.95,
        zDésactivé : -4.1,
        xOrg : 0,
        yOrg : -.2,
        zOrg : -3.8,
        muzOff: 2,
        muzMlt : 1.1,
        portée : 700,
        taux : 400,
        propagation: 150,
        zoom : 1.4,
        leanMlt : 1.6,
        recul : .01,
        reculR : .01,
        récupérer: .985,
        récupérerY : .996,
        récupérerF: .98,
        recul : 1.4,
        reculZ : 2
    }, {
        nom: "Alien Blaster",
        src : "arme_13",
        icône : "icône_13",
        son : "arme_13",
        secondaire : !0,
        nAuto : !0,
        transp : !0,
        nCas : !0,
        minRec : 50,
        tuer : ["", 50],
        type 1,
        Temps d'échange : 200,
        viserVitesse: 120,
        spdMlt : 1,
        munitions : 4,
        recharger : 1500,
        dmg: 40,
        percer : .85,
        dmgDrop : 20,
        échelle : 1.1,
        leftHoldY: -1,
        Maintien droitY : -.65,
        leftHoldZ: -.2,
        rightHoldZ: -.2,
        xDésactivé : 1.3,
        yDésactivé : -.95,
        zDésactivé : -4.1,
        xOrg : 0,
        yOrg : -.6,
        zOrg : -3.8,
        holdW: .7,
        muzOff: 2.2,
        muzOffY : .1,
        ID muz : 3,
        muzMlt : 1.1,
        portée : 700,
        taux : 150,
        propagation: 150,
        zoom : 1.4,
        leanMlt : 1.6,
        recul : .008,
        reculR : .01,
        récupérer: .985,
        récupérerY : .996,
        récupérerF: .98,
        recul : 1,05,
        reculZ : 2
    }, {
        nom: "Mains",
        corps à corps : !0,
        type 1,
        Temps d'échange : 350,
        spdMlt : 1.1,
        propagation: 100,
        leftHoldY: -.82,
        leftHoldX : 1.3,
        rightHoldX: -1.3,
        droitHoldY : -.82,
        leftHoldZ: -.5,
        rightHoldZ: -.5,
        xDésactivé : 0,
        yDésactivé : -.95,
        zDésactivé : -3,
        xOrg : 0,
        yOrg : 0,
        zOrg : 0,
        maigreMlt : 1
    }]
