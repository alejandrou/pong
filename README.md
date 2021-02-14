<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Tabla de contenidos</summary>
  <ol>
    <li>
      <a href="#Autor">Autor</a>
    </li>
    <li>
      <a href="#Trabajo realizado">Trabajo realizado</a>
    </li>
    <li><a href="#decisiones-adoptadas">Decisiones adoptadas</a></li>
    <li><a href="#referencias">Referencias</a></li>
    <li><a href="#herramientas">Herramientas</a></li>
    <li><a href="#resultado">Resultado</a></li>
  </ol>
</details>




## Autor

El autor de este proyecto es el estudiante Alejandro Daniel Herrera Cárdenes para la asignatura Creando Interfaces de Usuario (CIU) para el profesor Modesto Fernando Castrillón Santana. 


## Trabajo realizado

El trabajo se basa en hacer un pong en el programa Processing en el que puedan jugar dos jugadores.

## Decisiones adoptadas

Las mayores decisiones tomadas y las que mas pruebas requirieron fueron que las paletas no se salieran de los limites de la ventana y que la fisica de la pelota se ajustara con las paletas al hacer contacto con ellas.

* Este método detecta cuando las paletas llegan al limite de la ventana
  ```
    void restrictPaddle() {
    if (paddleYL - paddleH/2 < 0) {
      paddleYL = paddleYL + paddleS;
    }
    if (paddleYL + paddleH/2 > height) {
      paddleYL = paddleYL - paddleS;
    }
    if (paddleYR - paddleH/2 < 0) {
      paddleYR = paddleYR + paddleS;
    }
    if (paddleYR + paddleH/2 > height) {
      paddleYR = paddleYR - paddleS;
    }
  }

* Este método detecta cuando las paletas hacen contacto con la pelota añadiendole un sonido.

  ```
    void contactPaddle() {
    if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2 ) {
      if (speedX < 0) {
        speedX = -speedX*1;
        sonido.play();
      }
    }
    else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
      if (speedX > 0) {
        speedX = -speedX*1;
        sonido.play();
      }
    }
  }
  ```
  
  
  * Este método detecta cuando la pelota golpea en el limite de la ventana reiniciandola y sumando un punto por el lado en el que la golpea.
    Las últimas dos condiciones lo que permite es que la pelota rebote en la parte superior e inferior de la ventana añadiendo así también un sonido.

  ```
  void bounceOff() {
   if ( x > width - w/2) {
      setup();
      speedX = -speedX;
      scoreL = scoreL + 1;
    } else if ( x < 0 + w/2) {
      setup();
      scoreR = scoreR + 1;
    }
    if ( y > height - h/2) {
      speedY = -speedY;
      sonido.play();
    } else if ( y < 0 + h/2) {
      speedY = -speedY;
      sonido.play();
    }
  }
 ```





## Referencias

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



## Herramientas

* [Processing](https://www.processing.org/)




## Resultados

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Img Shields](https://shields.io)
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Pages](https://pages.github.com)
* [Animate.css](https://daneden.github.io/animate.css)
* [Loaders.css](https://connoratherton.com/loaders)
* [Slick Carousel](https://kenwheeler.github.io/slick)
* [Smooth Scroll](https://github.com/cferdinandi/smooth-scroll)
* [Sticky Kit](http://leafo.net/sticky-kit)
* [JVectorMap](http://jvectormap.com)
* [Font Awesome](https://fontawesome.com)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
