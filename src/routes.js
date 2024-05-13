/* eslint-disable max-len */
const {
  handlerAddBook, handlerGetAllBooks, handlerGetBookById, handlerEditBookById, handlerDeleteBookById,
} = require('./handler');

const routes = [
  {
    method: 'POST',
    path: '/books',
    handler: handlerAddBook,
  },
  {
    method: 'GET',
    path: '/books',
    handler: handlerGetAllBooks,
  },
  {
    method: 'GET',
    path: '/books/{id}',
    handler: handlerGetBookById,
  },
  {
    method: 'PUT',
    path: '/books/{id}',
    handler: handlerEditBookById,
  },
  {
    method: 'DELETE',
    path: '/books/{id}',
    handler: handlerDeleteBookById,
  },
];

module.exports = routes;
