<template>
    <section class="about-section">
        <div class="heading">
            <span>Rólunk</span>
        </div>

        <div class="row">
            <div class="about-content">
                <img src="../assets/images/zoli.jpg" alt="">
                <div class="about-content-text">
                    <p>Üdvözöljük a Bunker Pub-ban, ahol nem csupán egy egyszerű pubról van szó - hanem egy élményről, amely megidézi a jókedvet és az ízek világát egyaránt. Sárkány Zoltán álma volt, hogy 2024-ben megteremtse ezt a különleges helyet Szeged belvárosában, a Gogol utca 20. alatt. Az alapító szenvedélye az ízletes ételek és az minőségi italok iránt vezette őt, és ez tükröződik minden falatban és kortyban, amit a Bunker Pubban kínálunk.</p>
                    <p>A hangulatunkat a sötét fából készült bútorok és a rejtélyes fények adják, ami egy igazi bunker érzetét kelti. Az étlapunkon megtalálhatóak a klasszikusok, mint a frissen sütött pizza, a gazdag ízekkel teli burrito, valamint az ínycsiklandó hamburgerek és szendvicsek. Italválasztékunkban pedig megtalálhatóak a legjobb minőségű szeszes italok, frissítők és üdítők, hogy mindenki megtalálja a kedvére valót.</p>
                    <p>Nálunk mindenki megtalálhatja a számára legmegfelelőbb élményt, legyen szó egy baráti összejövetelről vagy egy bulizós éjszakáról. A Bunker Pub szeretettel várja Önöket, hogy részesei lehessenek az általunk nyújtott egyedülálló élménynek!</p>
                </div>
            </div>
        </div>

        <div class="row gallery">
            <div class="wrapper">
                <img src="../assets/images/pizza-1.jpg" alt="">
                <img src="../assets/images/pizza-2.jpg" alt="">
                <img src="../assets/images/gyros-1.jpg" alt="">
                <img src="../assets/images/gyros-2.jpg" alt="">
                <img src="../assets/images/gyros-3.jpg" alt="">
                <img src="../assets/images/hamburger-1.jpg" alt="">
                <img src="../assets/images/hamburger-2.jpg" alt="">
                <img src="../assets/images/hamburger-3.jpg" alt="">
                <img src="../assets/images/dessert-1.jpg" alt="">
                <img src="../assets/images/dessert-2.jpg" alt="">
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "About",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Satisfy&display=swap");

.about-section {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
}

.about-section .about-content {
    display: flex;
    width: 100%;
}

.about-section .about-content img {
    height: 407px;
    width: 100%;
    object-fit: contain;
}

.about-section .about-content .about-content-text {
    font-size: 18px;
    padding-left: 50px;
    color: white;
}

.about-section .gallery {
    overflow: hidden;
    padding: 100px;
}

.about-section .gallery .wrapper {
    position: relative;
    flex-grow: 1;
    margin: auto;
    max-width: 1200px;
    max-height: 1200px;
    display: grid;
    grid-template-columns: repeat(8, 1fr);
    grid-template-rows: repeat(4, 1fr);
    grid-gap: 2vmin;
    justify-items: center;
    align-items: center;
}

.about-section .gallery .wrapper img {
    z-index: 1;
    grid-column: span 2;
    max-width: 100%;
    margin-bottom: -52%;
    clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
    transform: scale(1);
    transition: all .25s;
}

.about-section .gallery .wrapper img:nth-child(7n + 1) {
    grid-column: 2 / span 2;
}

.about-section .gallery .wrapper img:hover {
    z-index: 2;
    transform: scale(2);
}

@media (max-width: 768px) {
    .about-section .about-content img {
        width: 250px;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2.5);
    }
}

@media (max-width: 576px) {
    .about-section .about-content img {
        width: inherit;
    }

    .about-section .about-content {
        display: block;
    }

    .about-section .about-content .about-content-text {
        padding-left: 0px;
    }

    .about-section .gallery {
        padding: 50px 0px;
    }

    .about-section .gallery .wrapper img {
        max-width: 100%;

    }

    .about-section .gallery .wrapper {
        grid-gap: 2vmin;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2);
    }

}
</style>