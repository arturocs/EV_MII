# Documentación práctica 5

**Arturo Cortés Sánchez**

* <u>Chorro de agua</u>: Al interactuar con el ordenador de la cúpula, el tapón de esta se abrirá dejando entrar un chorro de agua. Este chorro esta compuesto de 8000 partículas esféricas cayendo a gran velocidad. A cada partícula se le aplica un shader para que se asemeje en la medida de lo posible a una gota de agua. El emisor de partículas se llama `Chorro` y el material de las partículas se llama `agua.tres` 
* <u>Efecto visual "bajo el agua"</u>: Si el jugado se coloca bajo el chorro de agua cuando este está activo, se aplica un efecto de ondulación a la pantalla y adquiere un tono mas azulado. Esto se consigue con un `ColorRect` al que se pone un shader como material. El `ColorRect` en cuestión se llama EfectoAgua y el shader es un sub-recurso suyo
* <u>Cámara de vigilancia</u>: En la esquina de la primera habitación hay una cámara de vigilancia con una animación de rotación. Las imágenes captadas por esta cámara pueden ser visualizadas en la pantalla del ordenador. Este efecto se ha realizado de forma ligeramente distinta a la explicada en el guion. En lugar de usar un ShaderMaterial se utiliza un SpatialMaterial y en la textura del albedo se ha añadido una ViewportTexture con el viewport de la cámara de vigilancia. Esto facilita editar los valores de Metallic y Roughness para que la luz se refleje en la pantalla.
