using my.bookshop as my from '../db/books-schema';

@(path:'/odata/v4/books/catalog')
service CatalogService {
    @readonly entity Books as projection on my.Books;
}
