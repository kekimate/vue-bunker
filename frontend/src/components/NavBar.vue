<template>
    <div class="header">
        <router-link @click="scrollToTop()" to="/" class="logo"><img src="../assets/images/bunker.png" alt="" />
        </router-link>

        <nav class="navbar">
            <router-link @click="scrollToTop()" to="/">Kezdőlap</router-link>
            <router-link @click="scrollToTop()" to="/about">Rólunk</router-link>
            <router-link @click="scrollToTop()" to="/promotions">Promóciók</router-link>
            <router-link @click="scrollToTop()" to="/menu">Menü</router-link>
            <router-link @click="scrollToTop()" to="/table">Foglalás</router-link>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars menu-btn" @click="showNav"></div>
            <router-link @click="scrollToTop()" to="cart">
                <div class="fas fa-shopping-cart cart"></div>
            </router-link>

            <div v-if="!user" class="fas fa-user account" @click="showLog">
                <ul class="drop-down-select">
                    <li>
                        <router-link @click="scrollToTop()" to="/login">Bejelentkezés</router-link>
                    </li>
                    <li>
                        <router-link @click="scrollToTop()" to="/register">Regisztrálás</router-link>
                    </li>
                </ul>

            </div>

            <div v-else class="fas fa-user account" style="background: yellow;color: black;" @click="showLog">
                <ul class="drop-down-select">
                    <li>
                        <router-link @click="scrollToTop()" to="/myorder">Rendeléseim</router-link>
                    </li>
                    <li>
                        <router-link @click="handleLogout" to="/">Kijelentkezés</router-link>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
    name: 'NavBar',

    computed: {
        ...mapState(["user"])
    },

    mounted() {
        window.addEventListener('scroll', this.handleScroll);
    },
    unmounted() {
        window.removeEventListener('scroll', this.handleScroll);
    },

    methods: {
        ...mapMutations(["setUser"]),

        scrollToTop() {
            window.scrollTo(0, 0);
        },

        showNav: function () {
            let navbar = document.querySelector('.header .navbar');
            navbar.classList.toggle('active');
        },

        showLog: function () {
            let mq = window.matchMedia("(max-width: 768px)");
            if (mq.matches) {
                let log = document.querySelector('.drop-down-select');
                log.classList.toggle('active');
            }
        },

        handleScroll: function () {
            let navbar = document.querySelector('.header .navbar');
            navbar.classList.remove('active');
            let log = document.querySelector('.drop-down-select');
            log.classList.remove('active');
        },

        handleLogout: function () {
            this.setUser("");
        }
    }
}
</script>

<style scoped>
.header {
    position: sticky;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    background: rgb(85, 85, 85);
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 2rem 9%;
    height: 100px;
}

.header .logo {
    font-size: 2.5rem;
    font-weight: bolder;
    color: black;
}

.header .logo img {
    padding-right: .5rem;
    color: yellow;
    width: 100px;
    height: 100px;
}

.header .navbar a {
    font-size: 1.7rem;
    margin: 0 1rem;
    color: black;
}

.header .navbar a:hover {
    color: white;
}

.header .navbar a.router-link-exact-active {
    color: yellow;
}

.header .icons div {
    height: 4.5rem;
    width: 4.5rem;
    line-height: 4.5rem;
    font-size: 2rem;
    background: rgb(85, 85, 85);
    color: black;
    border-radius: .5rem;
    margin-left: .3rem;
    cursor: pointer;
    text-align: center;
}

.header .icons div:hover {
    color: black;
    background: yellow !important;
}

.header .icons a.router-link-exact-active .cart {
    background: yellow;
    color: black;
}

#menu-btn {
    display: none;
}

.header .icons .account .drop-down-select {
    display: none;
    position: absolute;
    margin-left: -50px;
    list-style-type: none;
}

.header .icons .account .drop-down-select a {
    text-decoration: none;
    color: black;
    font-size: 15px;
    font-weight: 500;
    float: left;
    width: 120px;
    border-radius: 5%;

}

.header .icons .account .drop-down-select.active {
    display: block !important;
}

.header .icons .account .drop-down-select.active a {
    background-color: darkgray;
}

.header .icons .account .drop-down-select.active a:hover {
    background-color: yellow;
    color: darkgray;
}

/* .header .icons .account:hover .drop-down-select {
    display: block;
} */

.header .icons .account:hover .drop-down-select a {
    background-color: darkgray;

}

.header .icons .account:hover .drop-down-select a:hover {
    background-color: yellow;
    color: black;
}

@media (min-width: 769px) {
    .header .icons .account:hover .drop-down-select {
        display: block;
    }
}

@media (max-width: 768px) {
    .header .navbar {
        position: absolute;
        top: 99%;
        left: 0;
        right: 0;
        background: darkgray;
        border-top: 0.1rem solid rgba(0, 0, 0, 0.2);
        border-bottom: 0.1rem solid rgba(0, 0, 0, 0.2);
        clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
    }

    .header .navbar.active {
        clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
    }

    .header .navbar a {
        font-size: 2rem;
        margin: 2rem;
        display: block;
    }

    #menu-btn {
        display: inline-block;
    }

}

@media (max-width: 576px) {
    .header .navbar a {
        font-size: 1.5rem;
        margin: 0;
    }
}
</style>