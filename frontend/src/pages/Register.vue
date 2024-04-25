<template>
    <div class="register-container">
        <div class="register-form-container">
            <form id="registerForm" @submit="handleSubmit" novalidate autocomplete="off">
                <h3>Regisztrálás</h3>
                <div class="form-group">
                    <label for="uName">Teljes név:
                    </label>
                    <input type="text" name="uName" placeholder="Teljes név" id="uName" class="form-control"
                        v-model="registerObj.name" />
                    <p class="error-mess" v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uEmail">Email:
                    </label>
                    <input type="email" name="uEmail" placeholder="email@gmail.com" id="uEmail" class="form-control"
                        v-model="registerObj.email" />
                    <p class="error-mess" v-if="errorObj.emailErr.length > 0">{{ errorObj.emailErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uPass">Jelszó:
                    </label>
                    <input type="password" name="uPass" placeholder="Jelszó" id="uPass"
                        class="form-control" v-model="registerObj.pass" />
                    <p class="error-mess" v-if="errorObj.passErr.length > 0">{{ errorObj.passErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uPassConfirm">Jelszó újra:
                    </label>
                    <input type="password" name="uPassConfirm" placeholder="Jelszó újra" id="uPassConfirm"
                        class="form-control" v-model="registerObj.confirm" />
                    <p class="error-mess" v-if="errorObj.confirmErr.length > 0">{{ errorObj.confirmErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uPhone">Telefonszám:
                    </label>
                    <input type="tel" name="uPhone" placeholder="+36201234567" id="uPhone"
                        class="form-control" v-model="registerObj.phone" />
                    <p class="error-mess" v-if="errorObj.phoneErr.length > 0">{{ errorObj.phoneErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uBirth">Születési év:
                    </label>
                    <input type="date" name="uBirth" id="uBirth" class="form-control" @click="availableTime()"
                        v-model="registerObj.birth" />
                    <p class="error-mess" v-if="errorObj.birthErr.length > 0">{{ errorObj.birthErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="">Nem:
                    </label>
                    <div class="form-group">
                        <input type="radio" name="gender" value="male" id="genderMale"
                            v-model="registerObj.gender" /><span>Férfi</span>
                        <input type="radio" name="gender" value="female" id="genderFemale"
                            v-model="registerObj.gender" /><span>Nő</span>
                    </div>
                    <p class="error-mess" v-if="errorObj.genderErr.length > 0">{{ errorObj.genderErr[0] }}</p>
                </div>

                <div class="form-group">
                    <input type="submit" value="Regisztrálás" class="btn" />
                    <p>Van már fiókja? <router-link @click="scrollToTop()" to="/login">Bejelentkezés</router-link>
                    </p>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    name: "Register",

    data() {
        return {
            registerObj: { name: "", email: "", pass: "", confirm: "", phone: "", birth: "", gender: "" },
            errorObj: { nameErr: [], emailErr: [], passErr: [], confirmErr: [], phoneErr: [], birthErr: [], genderErr: [] },
            matchUser: undefined,

        }
    },

    methods: {
        async getMatchUser(email) {
            let data = await axios.get('/users/' + email);
            this.matchUser = data.data;
        },

        scrollToTop() {
            window.scrollTo(0, 0);
        },

        availableTime: function () {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var currentMonth = ("0" + (now.getMonth() + 1)).slice(-2);
            var minRange = (now.getFullYear() - 150) + "-" + currentMonth + "-" + day;
            var maxRange = now.getFullYear() + "-" + currentMonth + "-" + day;

            document.getElementById("uBirth").setAttribute("min", minRange);
            document.getElementById("uBirth").setAttribute("max", maxRange);
        },

        resetCheckErr: function () {
            this.errorObj.nameErr = [];
            this.errorObj.emailErr = [];
            this.errorObj.passErr = [];
            this.errorObj.confirmErr = [];
            this.errorObj.phoneErr = [];
            this.errorObj.birthErr = [];
            this.errorObj.genderErr = [];
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
            if (!this.registerObj.name) {
                this.errorObj.nameErr.push("Név bevitele kötelező");
            }
            else {
                if (!/^(?:[A-ZÁÉÍÓÖŐÚÜŰ][a-záéíóöőúüű]*)(?:[-\s][A-ZÁÉÍÓÖŐÚÜŰ][a-záéíóöőúüű]*)+(?:\s+[A-ZÁÉÍÓÖŐÚÜŰ][a-záéíóöőúüű]*)*$/.test(this.registerObj.name)) {
                    this.errorObj.nameErr.push('A névben csak betűk lehetnek');
                }
            }

            // Email validate
            if (!this.registerObj.email) {
                this.errorObj.emailErr.push("Email bevitele kötelező");
            }
            else {
                if (!/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/.test(this.registerObj.email)) {
                    this.errorObj.emailErr.push('Nem valid email');
                }
            }

            // Pass validate
            if (!this.registerObj.pass) {
                this.errorObj.passErr.push('Jelszó bevitele kötelező');
            }
            else {
                if (!/[!@#$%^&*]/.test(this.registerObj.pass)) {
                    this.errorObj.passErr.push('A jelszónak tartalmaznia kell egy speciális karaktert');
                }

                if (this.registerObj.pass.length < 8) {
                    this.errorObj.passErr.push('A jelszónak 8 vagy annál több karakternek kell lennie');
                }
            }

            // Confirm Pass validate
            if (!this.registerObj.confirm) {
                this.errorObj.confirmErr.push('Jelszó újra bevitele kötelező');
            }
            else {
                if (this.registerObj.pass !== this.registerObj.confirm) {
                    this.errorObj.confirmErr.push('Nem egyező jelszó');
                }
            }


            // Phone validate
            if (!this.registerObj.phone) {
                this.errorObj.phoneErr.push('Telefonszám bevitele kötelező');
            }
            else {
                if (!this.registerObj.phone.startsWith('+36') && !this.registerObj.phone.startsWith('06')) {
                    this.errorObj.phoneErr.push('Telefonszám csak +36-al vagy 06-al kezdődhet');
                }

                if (this.registerObj.phone.length != 11 && this.registerObj.phone.length != 12) {
                    this.errorObj.phoneErr.push('A telefonszám hosszúsága nem megfelelő');
                }

                if (!/[0-9]{11}/.test(this.registerObj.phone) && !/[+0-9]{12}/.test(this.registerObj.phone)) {
                    this.errorObj.phoneErr.push('Telefonszámban csak számok és + lehet');
                }
            }

            // Birth validate
            if (!this.registerObj.birth) {
                this.errorObj.birthErr.push("Születésnap bevitele kötelező");
            }
            else {
                let minRange = document.getElementById("uBirth").getAttribute("min");
                let maxRange = document.getElementById("uBirth").getAttribute("max");
                let dateMin = new Date(minRange);
                let dateMax = new Date(maxRange);
                let dateInput = new Date(this.registerObj.birth);

                if (dateInput === "Nem valid dátum") {
                    this.errorObj.birthErr.push("Nem valid dátum bevitele");
                }

                if (dateInput.getTime() < dateMin.getTime() || dateInput.getTime() > dateMax.getTime()) {
                    this.errorObj.birthErr.push("A születési évek csak 150-évvel ezelőttre érhetőek el");
                }
            }

            // Gender validate
            if (!this.registerObj.gender) {
                this.errorObj.genderErr.push("Kérem válasszon nemet");
            }
        },

        async handleSubmit(e) {
            this.checkForm();

            if (!this.checkEmptyErr()) {
                e.preventDefault();
            } else {
                e.preventDefault();
                await this.getMatchUser(this.registerObj.email);
                if (this.matchUser) {
                    this.errorObj.emailErr.push("A fiók már létezik")
                }
                else {
                    let data = {
                        user_name: this.registerObj.name,
                        user_email: this.registerObj.email,
                        user_phone: this.registerObj.phone,
                        user_password: this.registerObj.pass,
                        user_birth: this.registerObj.birth,
                        user_gender: this.registerObj.gender
                    }
                    await axios.post("/users/", data);
                    this.$router.push("/login");
                }
            }
        }
    },

};
</script>


<style scoped>
.register-container {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
    background-size: cover;
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 200px);
}

.register-container .register-form-container {
    background: rgb(85, 85, 85);
    max-width: 70rem;
    width: 100%;
    margin: auto;
    padding: 2rem;
    border-radius: 0.5rem;
    animation: fadeUp 0.4s linear;
    overflow: hidden;
}

.register-container .register-form-container form {
    position: relative;
}

.register-container .register-form-container form h3 {
    padding-bottom: 1rem;
    font-size: 2rem;
    text-transform: uppercase;
    color: black;
    margin: 0;
}

.register-container .register-form-container form .form-control {
    margin: 0.7rem 0;
    border-radius: 0.5rem;
    background: lightgray;
    padding: 2rem 1.2rem;
    font-size: 1.6rem;
    color: black;
    text-transform: none;
    width: 100%;
    border: none;
}

.register-container .register-form-container form label {
    font-size: 2rem;
    margin: 0;
    padding: 0;
    color: black;
}

.register-container .register-form-container form span {
    font-size: 18px;
    padding-left: 5px;
    padding-right: 40px;
}

.register-container .register-form-container form .btn {
    margin: 1rem 0;
    width: 100%;
    text-align: center;
}

.register-container .register-form-container form p {
    padding-top: 1rem;
    font-size: 1.5rem;
    color: black;
    margin: 0;
}

.register-container .register-form-container form p a {
    color: yellow;
}

.register-container .register-form-container form p a:hover {
    color: white;
    text-decoration: underline;
}

.register-container .register-form-container form .form-group {
    margin: 0;
    color: black;
}

.register-container .register-form-container form .form-group .form-control{
    color: #666;
}

.register-container .register-form-container form .form-group .error-mess {
    font-size: 1.5rem;
    position: relative;
    color: rgb(243, 47, 47);
    margin: 0;
    padding: 0;
}
</style>