

// module.exports = srv => {
//     console.log(`Service name: ${srv.name} is served at ${srv.path}`)
//     srv.after('READ','Products', xs => {
//         console.log(xs)
// const newProducts = []
// xs.forEach(x => {
//     if (x.price > 40) {
//         x.name = '-10% off! ' + x.name 
//     }
//     newProducts.push(x);
// })
// console.log(newProducts);
// return newProducts;
// })
  // Reduce stock of ordered books

  module.exports = srv => {

//   srv.before ('CREATE', 'Products', async (req) => {
//     const product = req.data
//     if (!product.price || product.price <= 0)  return req.error (400, 'Understated price')
//     const tx = cds.transaction(req)
//     const affectedRows = await tx.run (
//       UPDATE (Products)
//         .set   ({ taxrate: {'-=': 1.2 }})
//         //.where ({ taxrate: {'>=': order.amount}, ID: order.book_ID})
//     )
//     if (affectedRows === 0)  req.error (409, "Can not implement")
//   })
  
//   srv.on ('CREATE', 'Orders', async (req) => {
//     const order = req.data
//     if (!order.deliveryDate) 
//     return req.error (400, 'Input Date of Delivery')
//     const tx = cds.transaction(req)
//     const affectedRows = await tx.run (
//       INSERT (Orders)
//         .set   ({ year: getFullYear(deliveryDate)})
//         //.where ({ taxrate: {'>=': order.amount}, ID: order.book_ID})
        
//     )
//     console.log(year)
//     if (affectedRows === 0)  req.error (409, "Can not implement")
//   })
// }

// }

//   // Add some discount 2
//   srv.after ('READ', 'Products', each => {
//     if (each.price > 100)  each.name += ' -- 11% discount!'
//   })

//   const cds = require('@sap/cds') 

// // Action button enables

//  module.exports = function () {

//     const { Products } = cds.entities 

//     this.after('READ', 'Products', (each) => {
//         //for new inquires only
//         if (each.status === 'P' ) { 
//             each.startEnabled = true
//         }
//         //for active inquires only
//         if (each.status !== 'D') {
//             each.closeEnabled = true
//         }
//     })

//     this.on ('start', async (req)=> {
//         const id = req.params[0]

//         const n = await UPDATE(Products).set({ 
//             status:'O'
//             //modifiedAt: Date.now()
//         }).where ({ID:id}).and({status:'P'})
//         n > 0 || req.error (404, "Content not found" ) 
//     })

//     this.on('close', async (req) => {
//         const id = req.params[0]
//         //const { satisfaction } = req.data
//         const n = await UPDATE(Products).set({ 
//               status: 'D'
//         }).where ({ID:id}).and({status_code:{'<>':'D'}})
//         n > 0 || req.error (404, "Content not found")        
//     })
// }
// //} 
// module.exports = (srv) => {

// const { Products } = cds.entities  

    // srv.on('start','Products', async (req) => {
    //     const { model, title } = req.data;
    //     const db = srv.transaction(req);
    //     const id = req.params[0]
    //     let { Products } = srv.entities;
    //     let res = await db.read(Products).where({ID:id});
    //     console.log(res);
    // })

// }

// module.exports = async()=>{ // called by server.js

//   const cds = require('@sap/cds')
//   const CatalogService = await cds.connect.to ('CatalogService')

//     // reflect entity definitions used below...
//   const { Products } = db.entities ('my.shop')
// }

// module.exports = srv => {
//     const { Products } = cds.entities
//     srv.on ('start', async req => {
//         const {id,price,title,model} = req.data
//           //const id = req.params[0]
//           console.log(id)
//           const status = req.data
//           console.log(price)
//           console.log(title)
//            //if (!status) {     
//         //   const n = await UPDATE(Products).set({ 
//         //       status: 'D',
//         //       price: 2000
//         //        }).where ({ID:id})
//         //n > 0 || req.error (404, "Content not found") 
//          // }    
//   })
  }
//    const {Products} = srv.entities
//     srv.on ('close','Products', async req => {
//           const id = req.params[0]
//           console.log(id)
//           const status = req.data
//           console.log(status)
//            //if (!status) {     
//           const n = await UPDATE(Products).set({ 
//               status: 'O',
//               price: -20
//                }).where ({ID:id})
//         //n > 0 || req.error (404, "Content not found") 
//          // }    
//   }
//   )

   
// }

