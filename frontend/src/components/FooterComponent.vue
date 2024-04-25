<template>
    <div class="footer">
        <div class="box-container">

            <div class="box">
                <h3>Menü</h3>
                <router-link @click="scrollToTop()" to="/menu/"><i class="fas fa-arrow-right"></i> taco</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> burrito</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> nachos</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> side food</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> dessert</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> drink</router-link>
            </div>

            <div class="box">
                <h3>Gyors linkek</h3>
                <router-link @click="scrollToTop()" to="/"> <i class="fas fa-arrow-right"></i> Kezdőlap</router-link>
                <router-link @click="scrollToTop()" to="/about"> <i class="fas fa-arrow-right"></i> Rólunk</router-link>
                <router-link @click="scrollToTop()" to="/promotions"> <i class="fas fa-arrow-right"></i> Promóciók</router-link>
                <router-link @click="scrollToTop()" to="/menu"> <i class="fas fa-arrow-right"></i> Menü</router-link>
                <router-link @click="scrollToTop()" to="/table"> <i class="fas fa-arrow-right"></i> Foglalás</router-link>
            </div>

            <div class="box">
                <h3>Extra linkek</h3>
                <div v-if="user">
                    <router-link @click="scrollToTop()" to="/cart"> <i class="fas fa-arrow-right"></i> Rendelésem</router-link>
                    <router-link @click="scrollToTop()" to="/myorder"> <i class="fas fa-arrow-right"></i> Rendeléseim</router-link>
                </div>
                <div v-else>
                    <router-link @click="scrollToTop()" to="/login"> <i class="fas fa-arrow-right"></i> Bejelentkezés
                    </router-link>
                    <router-link @click="scrollToTop()" to="/register"> <i class="fas fa-arrow-right"></i> Regisztrálás
                    </router-link>
                </div>
            </div>

            <div class="box">
                <h3>Nyitvatartás</h3>
                <p>Hétfő : Zárva</p>
                <p>Kedd : 17:00 - 00:00</p>
                <p>Szerda : 17:00 - 01:00</p>
                <p>Csütörtök : 17:00 - 01:00</p>
                <p>Péntek : 17:00 - 01:00</p>
                <p>Szombat : 17:00 - 01:00</p>
                <p>Vasárnap : Zárva</p>
            </div>

        </div>

        <div class="bottom">

            <div class="share">
                <a href="https://www.facebook.com/profile.php?id=61555935260056" class="fab fa-facebook-f" target="_blank"></a>
                <a href="https://www.instagram.com/bunkerpubszeged/" class="fab fa-instagram" target="_blank"></a>
                <a href="https://www.tiktok.com/@bunker_pub_szeged" class="fab fa-tiktok" target="_blank"></a>
            </div>

        </div>

    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    name: 'FooterComponent',

    computed: {
        ...mapState(['user'])
    },

    methods: {
        scrollToTop() {
            window.scrollTo(0, 0);
        }
    }
}
</script>

<style scoped>
/* footer */
.footer {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
}

.footer .box-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
    gap: 1.5rem;
}

.footer .box-container .box h3 {
    font-size: 2.2rem;
    color: yellow;
    padding: 1rem 0;
}

.footer .box-container .box p {
    font-size: 1.4rem;
    color: white;
    padding: 1px;
}

.footer .box-container .box a {
    display: block;
    font-size: 1.4rem;
    color: white;
    padding: 1rem 0;
}

.footer .box-container .box a:hover {
    color: yellow;
}

.footer .box-container .box a:hover i {
    padding-right: 2rem;
}

.footer .box-container .box a i {
    padding-right: .5rem;
    color: yellow;
}

.footer .bottom {
    padding-top: 1rem;
    text-align: center;
}

.footer .bottom .share {
    margin: 1.5rem 0;
}

.footer .bottom .share a {
    height: 4.5rem;
    width: 4.5rem;
    line-height: 4.5rem;
    font-size: 2rem;
    border-radius: .5rem;
    margin: 0 .3rem;
    color: black;
    background: yellow;
}

.footer .bottom .share a:hover {
    background: white;
}

@media (max-width: 576px) {
    .footer .box-container {

        grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));

    }

}
</style>