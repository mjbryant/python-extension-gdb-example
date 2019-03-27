#include <Python.h>

static PyObject * times_two(PyObject *self, PyObject *args) {
    float float_arg;
    if (!PyArg_ParseTuple(args, "f", &float_arg)) {
        return NULL;
    }
    return Py_BuildValue("f", float_arg * 2);
}

static PyMethodDef doubler_funcs[] = {
    { "double", times_two, METH_VARARGS, "Double a thing - IN C!" },
    { NULL, NULL, 0, NULL }
};

static PyModuleDef doubler = {
    PyModuleDef_HEAD_INIT,
    "doubler",   // name of module
    NULL,        // module documentation
    -1,          // size of per-interpreter state of module
    doubler_funcs
};

PyMODINIT_FUNC
PyInit_doubler(void) {
    return PyModule_Create(&doubler);
}
