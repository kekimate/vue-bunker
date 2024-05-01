<template>
    <div class="admin-container">
        <div class="d-flex justify-content-between">
            <h1>Üdv Admin!</h1>
            <button class="btn" @click="handleLogout()">Kijelentkezés</button>
        </div>

        <div class="table-responsive">
            <table class="table colored-header datatable project-list">
                <thead>
                    <tr>
                        <th>Számla Id</th>
                        <th>Felhasználó Id</th>
                        <th>Telefonszám</th>
                        <th>Cím</th>
                        <th>Időpont</th>
                        <th>Fizetve</th>
                        <th>Összeg</th>
                        <th>Státusz</th>
                        <th>Művelet</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(b) in filterBills.slice().reverse()" :key="b.bill_id">
                        <td>{{ b.bill_id }}</td>
                        <td>{{ b.user_id }}</td>
                        <td>{{ b.bill_phone }}</td>
                        <td>{{ b.bill_address }}</td>
                        <td>{{ b.bill_when }}</td>
                        <td>{{ b.bill_paid }}</td>
                        <td>{{ b.bill_total }} Ft</td>
                        <td>{{ avaiableStatus[b.bill_status] }}</td>
                        <td>
                            <button v-if="b.bill_status < 5" class="action-btn" @click="nextStatusBtn(b.bill_id)">
                                {{ avaiableStatus[b.bill_status + 1] }}
                            </button>

                            <button v-if="b.bill_status == 1" class="cancel-btn" @click="cancelBtn(b.bill_id)">
                                Visszavonás
                            </button>

                            <button v-else-if="b.bill_status == 5 && b.bill_paid == 'false'" class="paid-btn"
                                @click="paidBtn(b.bill_id)">
                                Fizetve
                            </button>

                            <button v-else-if="b.bill_status == 5 && b.bill_paid == 'true'" class="action-btn"
                                @click="nextStatusBtn(b.bill_id)">
                                {{ avaiableStatus[b.bill_status + 1] }}
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>


<script>
import axios from "axios";
import { mapState, mapMutations } from "vuex";
export default {
    name: 'Dashboard',

    data() {
        return {
            avaiableStatus: ["visszavonás", "elfogadva", "előkészítés", "ellenőrzés", "szállítás", "kiszállítva", "befejezve"],
            allBills: [],
            showOrderDetails: false,
            sendId: undefined,
            interval: "",
        }
    },

    created() {
        this.getAllBills();
        if (!this.admin) {
            this.$router.push("/");
        }
    },

    mounted: function () {
        this.autoUpdate();
    },

    beforeUnmount() {
        clearInterval(this.interval)
    },

    computed: {
        ...mapState(["allFoods", "admin"]),

        filterBills: function () {
            return this.allBills.filter((b) => b.bill_status < 6 && b.bill_status > 0);
        },
    },

    methods: {
        ...mapMutations(["setAdmin"]),

        async getAllBills() {
            this.allBills = (await axios.get('/billstatus')).data;
        },

        sendBillId: function (id) {
            this.sendId = id
            this.showOrderDetails = !this.showOrderDetails;
        },

        closeView: function () {
            this.showOrderDetails = !this.showOrderDetails;
        },

        handleLogout: function () {
            this.setAdmin("");
        },

        async nextStatusBtn(id) {
            await axios.put('/billstatus/' + id);
            this.getAllBills();
        },

        async paidBtn(id) {
            await axios.put('/billstatus/paid/' + id);
            this.getAllBills();
        },

        async cancelBtn(id) {
            await axios.put('/billstatus/cancel/' + id);
            this.getAllBills();
        },

        autoUpdate: function () {
            this.interval = setInterval(function () {
                this.getAllBills();
            }.bind(this), 1000);
        }

    },
}
</script>

<style scoped>
.admin-container .table-responsive .project-list thead tr th {
    color: yellow;
}
.admin-container {
    background-image: url("../assets/images/bg.jpg");
    height: 100vh;
    padding: 2rem 9%;
    font-size: 16px;
    color: yellow;
}

.project-list>tbody>tr>td {
    padding: 12px 8px;
    color: yellow;
}

.project-list>tbody>tr>td .avatar {
    width: 22px;
    border: 1px solid #CCC;
}

.table-responsive {
    margin-top: 8vh;
}

.action-btn,
.cancel-btn,
.paid-btn {
    width: 100px;
    height: 25px;
    color: white;
    text-transform: capitalize;
}

.action-btn {
    background-color: yellow;
    margin-right: 10px;
    color: black;
}

.cancel-btn,
.paid-btn {
    background-color: red;
}

.cancel-btn:hover {
    background-color: white;
    color: black;
}

.action-btn:hover {
    background-color: white;
}
</style>