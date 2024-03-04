<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CKEditor Example</title>
        <!-- Include jQuery library -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Include CKEditor script -->
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    </head>
    <body>

        <!-- Search input -->
        <div class="search-container mt-4">
            <input type="text" id="searchInput" placeholder="Search products...">
            <button onclick="searchProducts()">Search</button>
        </div>

        <!-- Category filter -->
        <div class="category-filter mt-4">
            <select id="categoryFilter" onchange="filterByCategory()">
                <option value="">All Categories</option>
                <!-- Populate options dynamically from your data -->
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Price filter -->
        <div class="price-filter mt-4">
            <label for="priceRange">Price Range:</label>
            <input type="range" id="priceRange" min="0" max="1000" value="0">
            <span id="priceOutput">0</span>
            <button onclick="filterByPrice()">Apply</button>
        </div>

        <!-- Sort options -->
        <div class="sort-options mt-4">
            <label for="sortSelect">Sort by:</label>
            <select id="sortSelect" onchange="sortProducts()">
                <option value="name">Name</option>
                <option value="price">Price</option>
            </select>
        </div>

        <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
            <div class="card shop-list border-0">
                <div class="card-body content pt-4 p-2">
                    <a class="text-dark product-name h6"></a>
                </div>
            </div>
        </div><!--end col-->
        <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
            <div class="card shop-list border-0">
                <div class="card-body content pt-4 p-2">
                    <a class="text-dark product-name h6">Nam</a>
                </div>
            </div>
        </div><!--end col-->
        <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
            <div class="card shop-list border-0">
                <div class="card-body content pt-4 p-2">
                    <a class="text-dark product-name h6">Dan</a>
                </div>
            </div>
        </div><!--end col-->
        <script>
            // JavaScript functions for search, filter, and sort
            function searchProducts() {
                var searchText = document.getElementById('searchInput').value.toLowerCase();
                var products = document.querySelectorAll('.shop-list');

                products.forEach(function (product) {
                    var productName = product.querySelector('.product-name').textContent.toLowerCase();
                    if (productName.includes(searchText)) {
                        product.style.display = 'block'; // Show the product if it matches the search text
                    } else {
                        product.style.display = 'none'; // Hide the product if it doesn't match the search text
                    }
                });
            }

            function filterByCategory() {
                var categoryFilter = document.getElementById('categoryFilter').value;
                // Perform category filter logic
            }

            function filterByPrice() {
                var priceRange = document.getElementById('priceRange').value;
                // Perform price filter logic
            }

            function sortProducts() {
                var sortSelect = document.getElementById('sortSelect').value;
                // Perform sorting logic based on selected option
            }
        </script>
    </body>
</html>
