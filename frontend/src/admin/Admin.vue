<template>
    <div class="admin-container">
        <div class="admin-form-container">
            <form id="adminForm" @submit="handleSubmit" novalidate autocomplete="off">
                <h3>ADMIN</h3>

                <div v-if="errors.length" class="error-box">
                    <ul>
                        <li v-for="error in errors" :key="error">{{ error }}</li>
                    </ul>
                </div>

                <div class="form-group">
                    <input type="password" id="uPass" name="uPass" class="form-control"
                        placeholder="Admin jelszó" v-model="adminObj.pass" />
                </div>

                <div class="form-group">
                    <input type="submit" value="Admin belépés" class="btn">
                </div>
            </form>
        </div>
    </div>
</template>


<script>
import { mapMutations } from "vuex";
export default {
    name: 'Admin',

    data() {
        return {
            adminObj: { pass: "" },
            key: "admin",
            errors: [],
        }
    },

    methods: {
        ...mapMutations(["setAdmin"]),

        handleSubmit(e) {
            this.errors = [];
            if (!this.adminObj.pass) {
                this.errors.push('Jelszó beírása kötelező');
            }

            if (!this.errors.length == 0) {
                e.preventDefault();
            }
            else {
                e.preventDefault();
                if (this.key === this.adminObj.pass) {
                    this.setAdmin("admin");
                    this.$router.push("/admin/dashboard");
                }
                else {
                    this.errors.push("Hibás admin jelszó!")
                }

            }
        }
    }
}
</script>

<style scoped>
.admin-container {
    padding: 2rem 9%;
    background-image: url("../assets/images/bg.jpg");
    background-size: cover;
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(90vh - 200px);
}

.admin-container .admin-form-container {
    background-color: rgb(85, 85, 85);
    max-width: 40rem;
    width: 100%;
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    border: 0.1rem solid rgba(0, 0, 0, 0.2);
    padding: 2rem;
    border-radius: .5rem;
    animation: fadeUp .4s linear;
}

.admin-container .admin-form-container form {
    position: relative;
}

.admin-container .admin-form-container form h3 {
    padding-bottom: 1rem;
    font-size: 2rem;
    font-weight: bolder;
    text-transform: uppercase;
    color: yellow;
    margin: 0;
}

.admin-container .admin-form-container form .form-control {
    margin: .7rem 0;
    border-radius: .5rem;
    background: lightgray;
    padding: 2rem 1.2rem;
    font-size: 1.6rem;
    color: black;
    text-transform: none;
    width: 100%;
    border: none;
}

.admin-container .admin-form-container form .btn {
    margin-bottom: 1rem;
    margin-top: 1rem;
    width: 100%;
}

.admin-container .admin-form-container form p {
    padding-top: 1rem;
    font-size: 1.5rem;
    color: #666;
    margin: 0;
}

.admin-container .admin-form-container form p a {
    color: yellow;
}

.admin-container .admin-form-container form p a:hover {
    color: black;
    text-decoration: underline;
}

.admin-container .admin-form-container form .error-box {
    background-color: #fff9fa;
    box-sizing: border-box;
    border: 2px solid rgba(255, 66, 79, .2);
    border-radius: 2px;
    font-size: 12px;
    margin-bottom: 20px;
}

.admin-container .admin-form-container form .error-box ul {
    list-style-type: none;
    margin: 0;
    padding: 10px 0px;
}

.admin-container .admin-form-container form .error-box ul li {
    padding-left: 10px;
    color: rgb(182, 0, 0);
}
</style>