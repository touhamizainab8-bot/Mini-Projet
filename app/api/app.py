from flask import Flask, request, jsonify

app = Flask(__name__)

notes = []

@app.route("/api/notes", methods=["GET"])
def get_notes():
    return jsonify(notes)

@app.route("/api/add", methods=["POST"])
def add_note():
    data = request.json
    notes.append(data["note"])
    return jsonify({"message": "note added"})

@app.route("/api/delete", methods=["POST"])
def delete_note():
    data = request.json
    note = data["note"]
    if note in notes:
        notes.remove(note)
        return jsonify({"message": "note deleted"})
    return jsonify({"error": "note not found"}), 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

