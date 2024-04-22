<template>
    <div class="promotions">
        <div class="heading">
            <span>Promóciók</span>
        </div>

        <div class="promotions-item">
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-dark-gray">
                            <th class="text-uppercase">Hétfő</th>
                            <th class="text-uppercase">Kedd</th>
                            <th class="text-uppercase">Szerda</th>
                            <th class="text-uppercase">Csütörtök</th>
                            <th class="text-uppercase">Péntek</th>
                            <th class="text-uppercase">Szombat</th>
                            <th class="text-uppercase">Vasárnap</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <span class="activity-name">Zárva</span>
                            </td>
                            <td>
                                <span class="activity-name">Pizza akció</span>
                                <div class="activity-percent">50% kedvezmény</div>
                            </td>

                            <td>
                                <span class="activity-name">Sör akció</span>
                                <div class="activity-percent">50% kedvezmény</div>
                            </td>
                            <td>
                                <span class="activity-name">Vodka akció</span>
                                <div class="activity-percent">50% kedvezmény</div>
                            </td>
                            <td>
                                <span class="activity-name">Whisky akció</span>
                                <div class="activity-percent">50% kedvezmény</div>
                            </td>
                            <td>
                                <span class="activity-name">Likőr akció</span>
                                <div class="activity-percent">50% kedvezmény</div>
                            </td>
                            <td>
                                <span class="activity-name">Zárva</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="promotions-item">
            <div class="content-box">
                <img src="../assets/images/pizza.jpg" alt="">
            </div>

            <div class="description">
                <h3>Keddi pizza akció</h3>
                <ul>
                    <li>
                        <p>2 pizza rendelése esetén a második féláron van!</p>
                    </li>
                    <li>
                        <p>Kedd : 17:00 - 00:00</p>
                    </li>
                </ul>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
        </div>

        <div class="promotions-item">
            <div class="content-box">
                <img src="../assets/images/beer.jpg" alt="">
            </div>

            <div class="description">
                <h3>Szerdai sör akció</h3>
                <ul>
                    <li>
                        <p>2 sör rendelése esetén a második féláron van!</p>
                    </li>
                    <li>
                        <p>Szerda : 17:00 - 01:00</p>
                    </li>
                </ul>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
        </div>

        <div class="promotions-item">
            <div class="content-box">
                <img src="../assets/images/vodka.jpg" alt="">
            </div>

            <div class="description">
                <h3>Csütörtöki vodka akció</h3>
                <ul>
                    <li>
                        <p>2 vodka rendelése esetén a második féláron van!</p>
                    </li>
                    <li>
                        <p>Csütörtök : 17:00 - 01:00</p>
                    </li>
                </ul>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
        </div>

        <div class="promotions-item">
            <div class="content-box">
                <img src="../assets/images/whisky.jpg" alt="">
            </div>

            <div class="description">
                <h3>Pénteki whisky akció</h3>
                <ul>
                    <li>
                        <p>2 whisky rendelése esetén a második féláron van!</p>
                    </li>
                    <li>
                        <p>Péntek : 17:00 - 01:00</p>
                    </li>
                </ul>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
        </div>

        <div class="promotions-item">
            <div class="content-box">
                <img src="../assets/images/likor.jpg" alt="">
            </div>

            <div class="description">
                <h3>Szombati likőr akció</h3>
                <ul>
                    <li>
                        <p>2 likőr rendelése esetén a második féláron van!</p>
                    </li>
                    <li>
                        <p>Szombat : 17:00 - 01:00</p>
                    </li>
                </ul>
                <router-link @click="scrollToTop()" to="/menu" class="btn">Rendelés</router-link>
            </div>
        </div>

    </div>

</template>

<script>
export default {
    name: "Promo",

    methods: {
        scrollToTop() {
            window.scrollTo(0, 0);
        }
    }
}
</script>

<style scoped>
.promotions {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
}

.promotions .promotions-item {
    width: 100%;
    margin-bottom: 20px;
    position: relative;
    display: flex;
}

/* Table */
.activity-name {
    padding: 5px 15px;
    margin-bottom: 10px;
    font-size: 18px;
    color: yellow;
}

.activity-percent {
    margin-top: 10px;
    font-size: 14px;
    color: white;
}

.bg-dark-gray {
    background-image: url("../assets/images/bg.jpg");
    color: white;
    font-size: 14px;
}

.table-bordered thead td,
.table-bordered thead th {
    border-bottom-width: 2px;
}

.table thead th {
    vertical-align: bottom;
    border: 0;
}

.table-bordered td,
.table-bordered th {
    border: 0;
}

.bg-yellow {
    background-color: yellow;
    color: black;
}

.table-bordered td,
.table-bordered th {
    border: 0;
}

.table td,
.table th {
    padding: .75rem;
    vertical-align: top;
    border: 0;
}

/* banner */
.promotions .promotions-item .content-box {
    position: relative;
    overflow: hidden;
    border-radius: 1rem;
    height: 30rem;
    max-width: 25%;
}

.promotions .promotions-item .content-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.promotions .promotions-item .description {
    position: relative;
    margin-left: 50px;
}

.promotions .promotions-item .description h3 {
    font-size: 28px;
    margin-bottom: 20px;
    color: yellow;
}

.promotions .promotions-item .description ul {
    margin-left: 40px;
}

.promotions .promotions-item .description li {
    margin-bottom: 30px;
    color: white;
}

.promotions .promotions-item .description p {
    font-size: 20px;
}

.promotions .promotions-item .description .btn {
    position: absolute;
    bottom: 0;
    left: 0;

}

@media (max-width: 768px) {

    .bg-yellow,
    .bg-yellow,
    .bg-yellow,
    .bg-bg-yellow {
        padding: 5px 0px;
        background-color: inherit;
        text-align: center;
    }

    .bg-yellow {
        color: yellow;
    }

    .promotions .promotions-item .content-box {
        max-width: 30%;
    }

    .promotions .promotions-item .content-box img {
        width: 100%;
        height: 100%;
        object-fit: fill;
    }

    .promotions .promotions-item .description h3 {
        font-size: 22px;
    }

    .promotions .promotions-item .description p {
        font-size: 12px;
    }


}

@media (max-width: 576px) {

    .activity-name {
        font-size: 10px;
    }

    .activity-percent {
        font-size: 8px;
    }

    .promotions .promotions-item .content-box {
        position: absolute;
        z-index: -1;
        opacity: 0.8;
        max-width: 100%;
        width: 100%;
        max-height: 100%;
        filter: brightness(40%);
    }

    .promotions .promotions-item .description {
        margin: 0;
        margin-left: 10px;
    }

    .promotions .promotions-item .description h3 {
        font-size: 14px;
        font-weight: 700;
        filter: brightness(150%);
    }

    .promotions .promotions-item .description p {
        font-size: 12px;
        color: white;
        font-weight: 500;
    }

    .promotions .promotions-item .description ul {
        margin-left: 10px;
        margin-bottom: 50px;
        list-style-type: none;
    }

    .promotions .promotions-item .description li {
        margin-bottom: 10px;
    }


}
</style>