                    @for ($i = 0; $i < $purchase_product->pivot->quantity; $i++)
                    <div class="product_list container">
                      <div class="row" onclick="window.location='product.html'">
                        <p class="col-lg-auto col-md-auto col-sm-auto">{{$purchase_product->name}}</p>
                        <hr class="col">
                        <p class="col-lg-auto col-md-auto col-sm-auto">{{$purchase_product->pivot->price}}€</p>
                      </div>
                    </div>
                    @endfor