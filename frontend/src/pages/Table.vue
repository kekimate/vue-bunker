<template>
    <vue-basic-alert :duration="300" :closeIn="2000" ref="alert" />
    <section class="order-section">

        <div class="heading">
            <span>Foglalás</span>
        </div>

        <div class="icons-container">

            <div class="icons ">
                <img src="../assets/images/icon-1.png" alt="">
                <h3>17:00 - 01:00</h3>
            </div>

            <div class="icons">
                <img src="../assets/images/icon-2.png" alt="">
                <h3>+36 30 517 9177</h3>
            </div>

            <div class="icons">
                <img src="../assets/images/icon-3.png" alt="">
                <h3>Szeged, Gogol utca 20</h3>
            </div>

        </div>

        <!-- booking form -->
        <form id="bookTableForm" @submit="handleSubmit" novalidate autocomplete="off">

            <div class="row">
                <div class="input-box">
                    <label for="uName">Teljes név</label>
                    <input type="text" name="uName" id="uName" v-model="orderObj.name">
                    <p v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="uPhone">Telefonszám</label>
                    <input type="text" name="uPhone" id="uPhone" v-model="orderObj.phone">
                    <p v-if="errorObj.phoneErr.length > 0">{{ errorObj.phoneErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="oPeople">Személyek száma</label>
                    <input type="number" name="oPeople" id="oPeople" v-model="orderObj.people">
                    <p v-if="errorObj.peopleErr.length > 0">{{ errorObj.peopleErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="oTables">Asztalok száma</label>
                    <input type="number" name="oTables" id="oTables" v-model="orderObj.tables">
                    <p v-if="errorObj.tablesErr.length > 0">{{ errorObj.tablesErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="uCard">Tagsági kártya száma</label>
                    <input type="text" name="uCard" id="uCard" v-model="orderObj.card">
                    <p v-if="errorObj.cardErr.length > 0">{{ errorObj.cardErr[0] }}</p>
                </div>
                <div class="input-box">
                    <label for="oWhen">Dátum</label>
                    <input type="datetime-local" name="oWhen" id="oWhen" v-model="orderObj.when"
                        @click="availableTime()">
                    <p v-if="errorObj.whenErr.length > 0">{{ errorObj.whenErr[0] }}</p>
                </div>
            </div>

            <div class="row">
                <div class="input-box">
                    <label for="uMessage">Üzenet</label>
                    <textarea placeholder="Üzenet, fontosabb információ" name="uMessage"
                        id="uMessage" cols="30" rows="10" v-model="orderObj.note"></textarea>
                </div>
                <div class="input-box">
                    <iframe class="map"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2758.8758923485125!2d20.139285076756828!3d46.25269498048449!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47448876a46f662d%3A0xe5f9291ab7b038f5!2sSzeged%2C%20Gogol%20u.%2020%2C%206722!5e0!3m2!1shu!2shu!4v1713872909426!5m2!1shu!2shu"
                        loading="lazy"></iframe>
                </div>  
            </div>

            <input type="submit" value="Foglalás" class="btn">
        </form>

    </section>
</template>

<script>
import axios from 'axios';
import VueBasicAlert from 'vue-basic-alert'
export default {
    name: "Table",

    data() {
        return {
            orderObj: { name: "", phone: "", people: "", tables: "", card: "", when: "", note: "" },
            errorObj: { nameErr: [], phoneErr: [], peopleErr: [], tablesErr: [], cardErr: [], whenErr: [] },
        }
    },

    methods: {
        availableTime: function () {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var currentMonth = ("0" + (now.getMonth() + 1)).slice(-2);
            var maxMonth = ("0" + (now.getMonth() + 3)).slice(-2);
            var hour = ("0" + (now.getHours())).slice(-2);
            var min = ("0" + (now.getMinutes())).slice(-2);
            var minRange = now.getFullYear() + "-" + currentMonth + "-" + day + "T" + hour + ":" + min;
            var maxRange = now.getFullYear() + "-" + maxMonth + "-" + day + "T" + hour + ":" + min;

            document.getElementById("oWhen").setAttribute("min", minRange);
            document.getElementById("oWhen").setAttribute("max", maxRange);
        },

        resetCheckErr: function () {
            this.errorObj.nameErr = [];
            this.errorObj.phoneErr = [];
            this.errorObj.peopleErr = [];
            this.errorObj.tablesErr = [];
            this.errorObj.cardErr = [];
            this.errorObj.whenErr = [];
        },

        checkEmptyErr: function () {
            for (var typeErr in this.errorObj) {
                if (this.errorObj[typeErr].length != 0) {
                    return false;
                }
            }
            return true;
        },



        checkForm: function () {
            this.resetCheckErr();

            // Name validate
            if (!this.orderObj.name) {
                this.errorObj.nameErr.push("Név kitöltése kötelező");
            }
            else {
                if (!/^(?:[A-Z][a-z]*)(?:[-\s][A-Z][a-z]*)+(?:\s+[A-Z][a-z]*)*$/.test(this.orderObj.name)) {
                    this.errorObj.nameErr.push('Nem megfelelő formátum');
                }
            }

            // Phone validate
            if (!this.orderObj.phone) {
                this.errorObj.phoneErr.push('Telefonszám kitöltése kötelező');
            }
            else {
                if (!this.orderObj.phone.startsWith('+36') && !this.orderObj.phone.startsWith('06')) {
                    this.errorObj.phoneErr.push('Telefonszám csak +36-al vagy 06-al kezdődhet');
                }

                if (!/[+0-9]{10}/.test(this.orderObj.phone)) {
                    this.errorObj.phoneErr.push('Telefonszámban csak számok és + lehet');
                }

                if (this.orderObj.phone.length != 11 && this.orderObj.phone.length != 12) {
                    this.errorObj.phoneErr.push('A telefonszám hosszúsága nem megfelelő');
                }
            }

            if (!this.orderObj.people) {
                this.errorObj.peopleErr.push("Személyek számának megadása kötelező");
            }
            else {
                if (parseInt(this.orderObj.people) > 100) {
                    this.errorObj.peopleErr.push("Egyszerre csak 100 személyt tudunk fogadni");
                }

                if (parseInt(this.orderObj.people) < 1) {
                    this.errorObj.peopleErr.push("Személyek száma csak 1 vagy több lehet");
                }
            }

            if (!this.orderObj.tables) {
                this.errorObj.tablesErr.push("Asztalok számának kitöltése kötelező");
            }
            else {
                if (parseInt(this.orderObj.tables) > 50) {
                    this.errorObj.tablesErr.push("Az asztalok száma nem haladhatja meg az 50-et");
                }

                if (parseInt(this.orderObj.tables) < 1) {
                    this.errorObj.tablesErr.push("Az asztalok száma csak 1 vagy több lehet");
                }

                if (parseInt(this.orderObj.people) < parseInt(this.orderObj.tables)) {
                    this.errorObj.tablesErr.push("Az asztalok számának kevesebbnek kell lenni mint a személyek száma");
                }
            }

            if (this.orderObj.card) {
                if (!/[0-9]{10}/.test(this.orderObj.card)) {
                    this.errorObj.cardErr.push('A kártyaszámban csak szám lehet');
                }

                if (this.orderObj.card.length != 10) {
                    this.errorObj.cardErr.push('A kártyaszám csak 10 szám lehet');
                }
            }

            if (!this.orderObj.when) {
                this.errorObj.whenErr.push("Dátum bevitele kötelező");
            }
            else {
                let minRange = document.getElementById("oWhen").getAttribute("min");
                let maxRange = document.getElementById("oWhen").getAttribute("max");
                let dateMin = new Date(minRange);
                let dateMax = new Date(maxRange);
                let dateInput = new Date(this.orderObj.when);

                if (dateInput === "Nem valid dátum") {
                    this.errorObj.whenErr.push("Nem valid dátum bevitel");
                }

                if (dateInput.getTime() < dateMin.getTime() || dateInput.getTime() > dateMax.getTime()) {
                    this.errorObj.whenErr.push("Foglalni csak mostantól a következő hónapig lehet");
                }

                if (dateInput.getHours() > 17 && dateInput.getHours() < 1) {
                    this.errorObj.whenErr.push("Csak 17:00 - 01:00-ig vagyunk nyitva");
                }
            }
        },

        async handleSubmit(e) {
            this.checkForm();

            if (!this.checkEmptyErr()) {
                e.preventDefault();
            } else {
                e.preventDefault();

                let data = {
                    book_name: this.orderObj.name,
                    book_phone: parseInt(this.orderObj.phone),
                    book_people: parseInt(this.orderObj.people),
                    book_tables: parseInt(this.orderObj.tables),
                    user_id: parseInt(this.orderObj.card),
                    book_when: this.orderObj.when,
                    book_note: this.orderObj.note,
                }

                await axios.post("/booking", data);

                this.$refs.alert.showAlert('success', 'Köszönjük! Nemsokára értesítjük a foglalásával kapcsolatban', 'Sikeres foglalás !')
                document.getElementById("bookTableForm").reset();
            }
        }
    },

    components: {
        VueBasicAlert
    }

}
</script>

<style scoped>
.order-section {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
}

.order-section .icons-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(40rem, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.order-section .icons-container .icons {
    border-radius: .5rem;
    padding: 2rem;
    text-align: center;
    background: rgb(85, 85, 85);
}

.order-section .icons-container .icons img {
    height: 10rem;
}

.order-section .icons-container .icons h3 {
    font-size: 2rem;
    color: black;
    margin-top: .5rem;
}

.order-section form {
    background: rgb(85, 85, 85);
    padding: 2rem;
    border-radius: .5rem;
}

.order-section form .row {
    justify-content: space-between;
}

.order-section form .row .input-box {
    width: 49%;
    padding: 1.8rem 0;
    color: black;
}

.order-section form .row label {
    font-size: 1.7rem;
    color: black;
}

.order-section form .row p {
    font-size: 1.5rem;
    position: absolute;
    color: rgb(243, 47, 47);
    margin: 0;
    padding-top: 5px;
}

.order-section form .row input,
.order-section form .row textarea {
    width: 100%;
    margin-top: .5rem;
    padding: 1rem 1.2rem;
    width: 100%;
    border-radius: .5rem;
    font-size: 1.6rem;
    text-transform: none;
    color: black;
    background-color: lightgray;
}

.order-section form .row textarea {
    height: 20rem;
    resize: none;
}

.order-section form .row .map {
    height: 100%;
    width: 100%;
    border-radius: .5rem;
}

@media (max-width: 768px) {
    .order form .row .input-box {
        width: 100%;
    }

    .order-section form .row {
        display: block;
        max-width: 100%;
        width: 100%;
        margin: 0;
    }

    .order-section form .row .input-box {
        width: 100%;
    }

}

@media (max-width: 576px) {
    .order-section .icons-container {
        grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
    }
}
</style>