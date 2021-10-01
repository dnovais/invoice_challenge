import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
import Maska from 'maska'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)
Vue.use(Maska)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  let element = document.getElementById("invoice")

  if (element != null) {

    let id = element.dataset.id
    let invoice = JSON.parse(element.dataset.invoice)
    let company = JSON.parse(element.dataset.companyAttributes)
    let client = JSON.parse(element.dataset.clientAttributes)
    let items = JSON.parse(element.dataset.itemsAttributes)

    let company_attributes = []
    company_attributes.push(company)

    let client_attributes = []
    client_attributes.push(client)
    
    invoice.company_attributes = company_attributes
    invoice.client_attributes = client_attributes
    invoice.items_attributes = items

    console.log(invoice)

    let app = new Vue({
      el: element,
      data: function() {
        return {
          id: id,
          invoice: {
            title: '',
            status: '',
            due_date: '',
            total: 0.0,
            company_attributes: [
              {
                name: '',
                email: '',
                cnpj: '',
                address: '',
                phone: '',
              }
            ],
            client_attributes: [
              {
                name: '',
                email: '',
                cpf: '',
                address: '',
                phone: '',
              }
            ],
            items_attributes: []
          },
          errors: {},
        }
      },
      methods: {
        addItem: function() {
          this.invoice.items_attributes.push({
            name: "",
            description: "",
            unit_cost: 0.0,
            quantity: 0,
          })
        },
        removeItem: function(index) {
          this.invoice.items_attributes.splice(index, 1)
        },
        saveInvoice() {
          this.$http.post(
            '/api/invoices',
            {
              invoice: {
                title: this.invoice.title,
                status: this.invoice.status,
                due_date: this.invoice.due_date,
                total: this.invoice.total,
                company_attributes: this.invoice.company_attributes[0],
                client_attributes: this.invoice.client_attributes[0],
                items_attributes: this.invoice.items_attributes
              } 
            }
          )
          .then(response => {
            Turbolinks.visit(`/invoices/${response.body.invoice.id}`)
          }, response => {
            this.errors = response.body.invoice
          })
        }
      }
    })
  }
});