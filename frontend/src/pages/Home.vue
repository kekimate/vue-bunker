<template>
    <div>
        <div class="home-main">
            <div class="content">
                <h3>Bunker Pub</h3>
                <p>Pizza, óriás hambi, gyros, tortilla, óriás palacsinta, gofri vagy esetleg néhány korsó vagy shot? Nálunk ezeket mind megkaphatod kedvező áron!</p>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
            <div class="image">
                <img src="../assets/images/back-image.jpg" alt="" class="home-img">
            </div>
        </div>


        <div class="home-category">
            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/pizza-img.png" alt="">
                <h3>Pizza</h3>
            </router-link>

            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/gyros-img.png" alt="">
                <h3>Gyros</h3>
            </router-link>

            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/hamburger-img.png" alt="">
                <h3>Hamburger</h3>
            </router-link>

            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/tortilla-img.png" alt="">
                <h3>Tortilla</h3>
            </router-link>

            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/dessert-img.png" alt="">
                <h3>Desszert</h3>
            </router-link>

            <router-link @click="scrollToTop()" to="/menu" class="box">
                <img src="../assets/images/drink-img.png" alt="">
                <h3>Ital</h3>
            </router-link>
        </div>

        <div class="home-banner">
            <div class="grid-banner row">
                <div class="grid col-md-4">
                    <img src="../assets/images/pizza.jpg" alt="">
                    <div class="content">
                        <span>Különleges ajánlat</span>
                        <h3>50% kedvezmény</h3>
                        <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
                    </div>
                </div>

                <div class="grid col-md-4">
                    <img src="../assets/images/beer.jpg" alt="">
                    <div class="content center">
                        <span>Különleges ajánlat</span>
                        <h3>50% kedvezmény</h3>
                        <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
                    </div>
                </div>

                <div class="grid col-md-4">
                    <img src="../assets/images/vodka.jpg" alt="">
                    <div class="content">
                        <span>Különleges ajánlat</span>
                        <h3>50% kedvezmény</h3>
                        <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
                    </div>
                </div>

            </div>

        </div>

        <div class="home-about">
            <div class="image">
                <img src="../assets/images/about-img.jpg" alt="">
            </div>
            <div class="content">
                <span>Miért válasszon minket?</span>
                <p>Ha különleges élményre vágyik étel- és italkínálatunkban, válassza a Bunker Pub-ot! Varázslatos atmoszféránkban olyan ínycsiklandó ételeket kóstolhat, mint a frissen sütött pizza és a gazdag ízekkel teli burrito. Italaink között pedig megtalálhatóak a klasszikusok, mint a vodka sprite és a frissítő Coca-Cola. Legyen részese a Bunker élménynek, és garantáltan emlékezetes perceket él át nálunk!</p>
                <router-link @click="scrollToTop()" to="/about" class="btn">Tovább</router-link>

                <div class="icons-container">
                    <div class="icons">
                        <img src="../assets/images/serv-1.png" alt="">
                        <h3>Gyors szállítás</h3>
                    </div>
                    <div class="icons">
                        <img src="../assets/images/serv-2.png" alt="">
                        <h3>Friss ételek</h3>
                    </div>
                    <div class="icons">
                        <img src="../assets/images/serv-3.png" alt="">
                        <h3>Kiváló minőség</h3>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Home",

    methods: {
        scrollToTop() {
            window.scrollTo(0, 0);
        }
    }
};
</script>

<style scoped>
.home-main,
.home-about,
.home-banner,
.home-category {
    padding: 2rem 9%;
}

.home-main {
    display: flex;
    align-items: center;
    flex-wrap: wrap-reverse;
    gap: 2rem;
    position: relative;
    overflow: hidden;
    background-image: url("../assets/images/bg.jpg");
}

.home-main .content {
    flex: 1 1 41rem;
}

.home-main .content span {
    font-size: 2rem;
    color: yellow;
}

.home-main .content h3 {
    font-size: 4rem;
    color: yellow;
    padding-top: 1rem;
}

.home-main .content p {
    font-size: 1.8rem;
    color: white;
    line-height: 2;
    padding: 1rem 0;
}

.home-main .image {
    flex: 1 1 41rem;
    margin: 2rem 0;
    pointer-events: none;
}

.home-main .image .home-img {
    width: 100%;
    margin-top: 5rem;
}

.home-main .home-parallax-img {
    position: absolute;
    top: -15rem;
    right: -15rem;
    width: 80vw;

}


/* home category */
.home-category {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(10rem, 1fr));
    gap: 1.5rem;
    padding-bottom: 5rem;
    background-image: url("../assets/images/bg.jpg");
}

.home-category .box {
    padding: 2rem;
    text-align: center;
    border-radius: .5rem;
    background: rgb(85, 85, 85);
}

.home-category .box:hover {
    background: yellow;
}

.home-category .box:hover h3 {
    color: black;
}

.home-category .box img {
    height: 7rem;
}

.home-category .box h3 {
    font-size: 1.8rem;
    color: black;
}


/* home banner */

.home-banner {
    background-image: url("../assets/images/bg.jpg");
}
.home-banner .row-banner {
    height: 45rem;
    background-size: cover;
    background-position: center;
    position: relative;
}

.home-banner .row-banner .content {
    position: absolute;
    top: 50%;
    left: 7%;
    transform: translateY(-50%);
}

.home-banner .row-banner .content span {
    font-family: 'Satisfy', cursive;
    font-size: 4rem;
    color: yellow;
    color: yellow;
}

.home-banner .row-banner .content h3 {
    font-size: 6rem;
    color: red;
    text-transform: uppercase;
}

.home-banner .row-banner .content p {
    font-size: 2rem;
    padding-bottom: 1rem;
}


.home-banner .grid-banner .grid {
    border-radius: 1rem;
    overflow: hidden;
    height: 45rem;
}

.home-banner .grid-banner .grid:hover img {
    transform: scale(1.2);
}

.home-banner .grid-banner .grid img {
    height: 100%;
    width: 100%;
    object-fit: cover;
}

.home-banner .grid-banner .grid .content {
    position: absolute;
    top: 2rem;
    padding: 0 2rem;
}

.home-banner .grid-banner .grid .content.center {
    text-align: center;
    width: 100%;
}

.home-banner .grid-banner .grid .content.center span {
    color: #fff;
}

.home-banner .grid-banner .grid .content.center h3 {
    color: #fff;
}

.home-banner .grid-banner .grid .content span {
    font-size: 2.5rem;
    color: #fff;
}

.home-banner .grid-banner .grid .content h3 {
    font-size: 3rem;
    color: #fff;
    padding-top: .5rem;
}

.home-about {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 2rem;
    background: #f7f7f7;
    background-image: url("../assets/images/bg.jpg");
}

.home-about .image {
    flex: 1 1 40rem;
}

.home-about .image img {
    width: 100%;
}

.home-about .content {

    flex: 1 1 40rem;
}

.home-about .content span {
    font-family: 'Satisfy', cursive;
    font-size: 3rem;
    color: yellow;
}

.home-about .content .title {
    font-size: 3rem;
    padding-top: .5rem;
    color: yellow;
}

.home-about .content p {
    padding: 1rem 0;
    line-height: 2;
    font-size: 1.6rem;
    color: white;
}

.home-about .content .icons-container {
    margin-top: 2rem;
    display: flex;
    flex-wrap: wrap;
    gap: 1.5rem;
}

.home-about .content .icons-container .icons {
    flex: 1 1 20rem;
    border-radius: .5rem;
    background: rgb(85, 85, 85);
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    display: flex;
    align-items: center;
    gap: 2rem;
    padding: 2rem;
}

.home-about .content .icons-container .icons h3 {
    font-size: 1.7rem;
    color: black;
}

@media (max-width: 768px) {
    #menu-btn {
        display: inline-block;
    }

    .home-main .home-parallax-img {
        top: 0;
        right: 0;
        width: 100%;
    }

    .home-banner .grid-banner .content h3 {
        font-size: 15px !important;
    }

    .home-banner .grid-banner .content.center {
        padding-left: 0px !important;
    }

}

@media (max-width: 576px) {
    .home-main .content h3 {
        font-size: 3rem;
    }

    .home-main .content p {
        font-size: 1.5rem;
    }
}
</style>




